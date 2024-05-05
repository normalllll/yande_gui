use flutter_rust_bridge::DartFnFuture;
use lazy_static::lazy_static;
use crate::yande::http_client::HttpClient;
use crate::yande::model::{Post, Similar};

pub struct YandeClient {
    http: HttpClient,
}

impl YandeClient {
    pub fn new() -> Self {
        Self {
            http: HttpClient::new(),
        }
    }
}

impl YandeClient {
    pub async fn get_posts(&self, tags: Vec<String>, limit: usize, page: usize) -> anyhow::Result<Vec<Post>> {
        let tags = tags.iter().map(|tag| ("tags", tag.as_str())).collect::<Vec<_>>();
        let resp = self.http.get("https://yande.re/post.json", Some(
            tags.iter().chain(vec![
                ("limit", limit.to_string().as_str()),
                ("page", page.to_string().as_str()),
            ].iter()).map(|(k, v)| (*k, *v)).collect::<Vec<_>>()
        )).await?;
        let posts = resp.json::<Vec<Post>>().await?;
        Ok(posts)
    }

    pub async fn get_similar(&self, post_id: u64) -> anyhow::Result<Similar> {
        let resp = self.http.get("https://yande.re/post/similar.json", Some(
            vec![("id", post_id.to_string().as_str())]
        )).await?;
        let similar = resp.json::<Similar>().await?;
        Ok(similar)
    }

    pub async fn download_to_file(&self, url: String, file_path: String, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static) -> anyhow::Result<()> {
        self.http.download_to_file(&url, &file_path, progress_callback).await?;
        Ok(())
    }

    pub async fn download_to_memory(&self, url: String, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static) -> anyhow::Result<Vec<u8>> {
        let bytes = self.http.download_to_memory(&url, progress_callback).await?;
        Ok(bytes)
    }
}


lazy_static! {
    pub static ref YANDE_CLIENT: YandeClient = YandeClient::new();
}