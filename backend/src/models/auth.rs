use axum::{Extension, Json};
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use surrealdb::engine::remote::ws::Ws;
use surrealdb::opt::auth::Root;
use surrealdb::sql::Thing;
use surrealdb::Surreal;

#[derive(Deserialize, Debug)]
pub struct User {
    pub email: String,
    pub password: String,
}
