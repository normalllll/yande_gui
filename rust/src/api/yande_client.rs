use flutter_rust_bridge::DartFnFuture;
use crate::yande::model::Post;
use crate::yande::YANDE_CLIENT;

pub async fn get_posts(tags: Vec<String>, limit: usize, page: usize) -> anyhow::Result<Vec<Post>> {
    YANDE_CLIENT.get_posts(tags, limit, page).await
}

pub async fn get_similar(post_id: u64) -> anyhow::Result<crate::yande::model::Similar> {
    YANDE_CLIENT.get_similar(post_id).await
}

pub async fn download_to_file(url: String, file_path: String, progress_callback: impl Fn(usize, usize) -> DartFnFuture<()> + 'static) -> anyhow::Result<()> {
    YANDE_CLIENT.download_to_file(url, file_path, progress_callback).await?;
    Ok(())
}

pub async fn download_to_memory(url: String, progress_callback: impl Fn(usize, usize)-> DartFnFuture<()> + 'static) -> anyhow::Result<Vec<u8>> {
    let bytes = YANDE_CLIENT.download_to_memory(url, progress_callback).await?;
    Ok(bytes)
}