use axum::{Extension, Json};
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use surrealdb::engine::remote::ws::Ws;
use surrealdb::opt::auth::Root;
use surrealdb::sql::Thing;
use surrealdb::Surreal;

mod error;

pub use self::error::Result;

#[derive(Debug, Deserialize)]
struct Record {
    #[allow(dead_code)]
    id: Thing,
}

#[derive(Debug, Serialize)]
struct User<'a> {
    username: &'a str,
    email: &'a str,
    wallet_address: &'a str,
}

// struct RetUser{
//     username: String,
//     email: String,
//     wallet_address: String,
// }

async fn register_user(Json(credentials): Json<models::auth::User>, db: Surreal<Client>) -> Result {
    if credentials.email.is_empty() || credentials.password.is_empty() {
        return Err(AppError::MissingCredential);
    }

    let created: Vec<Record> = db
        .create("user")
        .content(User {
            username: credentials.username,
            email: credentials.email,
            wallet_address: credentials.wallet_address,
        })
        .await?;

    println!("{{ \n{:?}, {:?} }}", created[0].id.id, created[0].username);

    Ok(Json(json!({"msg":"registerd user"})))
}

async fn login_user(Json(credentials): Json<models::auth::User>, db: Surreal<Client>) {
    if credentials.email.is_empty() || credentials.password.is_empty() {
        return Err(AppError::MissingCredential);
    }
}
