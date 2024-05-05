use std::io::Write;
use std::net::{IpAddr, Ipv4Addr, SocketAddr};
use flutter_rust_bridge::DartFnFuture;

use futures_util::stream::StreamExt;
use reqwest::Url;

pub struct HttpClient {
    client: reqwest::Client,
}


impl HttpClient {
    pub fn new() -> Self {
        //198.98.58.238
        let socket = SocketAddr::new(IpAddr::V4(Ipv4Addr::new(198, 98, 58, 238)), 443);
        Self {
            client: reqwest::ClientBuilder::new().
                tls_sni(false).
                resolve("yande.re", socket).
                resolve("files.yande.re", socket).
                resolve("assets.yande.re", socket).
                danger_accept_invalid_certs(true).
                build().unwrap(),
        }
    }

    pub async fn get(&self, url: &str, params: Option<Vec<(&str, &str)>>) -> anyhow::Result<reqwest::Response> {
        let url = match params {
            Some(params) => {
                Url::parse_with_params(url, params)?
            }
            None => Url::parse(url)?,
        };
        // println!("{:?}", url.as_str());
        self.client.get(url).send().await.map_err(|e| e.into())
    }

    pub async fn download_to_memory(&self, url: &str, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static) -> anyhow::Result<Vec<u8>> {
        let resp = self.get(url, None).await?;


        let total_size = resp.content_length().ok_or("No content length").map_err(|e| anyhow::anyhow!(e))?;
        let mut received = 0;

        let mut bytes_stream = resp.bytes_stream();

        let mut bytes = Vec::with_capacity(total_size as usize);

        while let Some(item) = bytes_stream.next().await {
            let chunk = item?;
            received += chunk.len();
            progress_callback(received, total_size as usize).await;

            bytes.extend_from_slice(&chunk);
        }
        Ok(bytes)
    }

    pub async fn download_to_file(&self, url: &str, file_path: &str, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static) -> anyhow::Result<()> {
        let resp = self.get(url, None).await?;


        let total_size = resp.content_length().ok_or("No content length").map_err(|e| anyhow::anyhow!(e))?;

        let mut bytes_stream = resp.bytes_stream();

        let mut file = std::fs::File::create(file_path)?;

        let mut received = 0;

        while let Some(item) = bytes_stream.next().await {
            let chunk = item?;
            received += chunk.len();
            progress_callback(received, total_size as usize).await;

            file.write_all(&chunk)?;
            file.flush()?;
        }

        Ok(())
    }
}