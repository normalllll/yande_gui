use flutter_rust_bridge::DartFnFuture;
use crate::yande::http_client::HttpClient;
use crate::yande::model::{Post, Similar};

pub struct YandeClient {
    http: HttpClient,
}

impl YandeClient {
    pub fn new(ips: Option<[String; 3]>) -> Self {
        Self {
            http: HttpClient::new(ips),
        }
    }
}

impl YandeClient {
    pub async fn get_posts(&self, tags: Vec<String>, limit: u32, page: u32) -> anyhow::Result<Vec<Post>> {
        let tags = tags.join("+");
        let resp = self.http.get("https://yande.re/post.json", Some(
            vec![
                ("tags", tags.as_str()),
                ("limit", limit.to_string().as_str()),
                ("page", page.to_string().as_str()),
            ].iter().map(|(k, v)| (*k, *v)).collect::<Vec<_>>()
        )).await?;
        let posts = resp.json::<Vec<Post>>().await?;
        Ok(posts)
    }

    pub async fn get_similar(&self, post_id: i64) -> anyhow::Result<Similar> {
        let resp = self.http.get("https://yande.re/post/similar.json", Some(
            vec![("id", post_id.to_string().as_str())]
        )).await?;
        let similar = resp.json::<Similar>().await?;
        Ok(similar)
    }

    // pub async fn download_to_file(&self, url: String, file_path: String, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static) -> anyhow::Result<()> {
    //     self.http.download_to_file(&url, &file_path, progress_callback).await?;
    //     Ok(())
    // }

    pub async fn download_to_memory(&self, url: &str, auto_multiple_part: bool, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static + Send) -> anyhow::Result<Vec<u8>> {
        let bytes = self.http.download_to_memory(&url, auto_multiple_part, progress_callback).await?;
        Ok(bytes)
    }
}
