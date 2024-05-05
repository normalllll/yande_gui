use flutter_rust_bridge::frb;
use serde::{Deserialize, Serialize};
use crate::yande::model::Post;

#[frb()]
#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Similar {
    pub posts: Vec<Post>,
    pub source: Post,
}