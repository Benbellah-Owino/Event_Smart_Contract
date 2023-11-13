#![allow(unused)]
// region:   ---  modules

mod models;

use axum::extract::{Path, Query};
use axum::http::{Method, Uri};
use axum::response::{Html, IntoResponse, Response};
use axum::routing::{get, get_service, post};
use axum::{middleware, Json, Router};

use axum::Extension;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use surrealdb::engine::remote::ws::Ws;
use surrealdb::opt::auth::Root;
use surrealdb::sql::Thing;
use surrealdb::Surreal;

use tower_http::cors::{Any, CorsLayer};

use sqlx::postgres::PgPoolOptions;

use tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};
// endregion: --- modules

#[derive(Debug, Deserialize)]
struct Record {
    #[allow(dead_code)]
    id: Thing,
    username: String,
}

#[derive(Debug, Deserialize)]
struct GetUser {
    id: Thing,
    username: String,
    email: String,
    wallet_address: String,
}

struct User<'a> {
    username: &'a str,
    email: &'a str,
    wallet_address: &'a str,
}

#[tokio::main]
async fn main() -> surrealdb::Result<()> {
    //let durl = std::env::var("DATABASE_URL").expect("set DATABASE_URL env variable");
    //  region:     --- initiate loging
    tracing_subscriber::registry()
        .with(tracing_subscriber::EnvFilter::new(
            std::env::var("RUST_LOG").unwrap_or_else(|_| "backend=debug".into()),
        ))
        .with(tracing_subscriber::fmt::layer())
        .init();
    //  endregion:  --- initiate loging

    let cors = CorsLayer::new().allow_origin(Any);

    // let pool = PgPoolOptions::new()
    //     .max_connections(5)
    //     .connect(&durl)
    //     .await
    //     .expect("unable to connect to database");

    let db = Surreal::new::<Ws>("127.0.0.1:8000").await?;

    db.signin(Root {
        username: "",
        password: "",
    })
    .await?;

    // db.use_ns("EVENT_CONTRACT").use_db("ticket_test1").await?;

    // let user: Option<GetUser> = db.select(("user", "3ievntr8w808y8o7umnh")).await?;

    // let user = user.unwrap();

    // let user_id = &user.id.id.to_string().clone;

    // println!("{:?}", user.id.id.to_string());

    // let id = Thing::from(user_id);

    // println!("{:?}", id);

    // let created: Vec<Record> = db
    //     .create("user")
    //     .content(User {
    //         username: "user1",
    //         email: "test@b3d3v.com",
    //         wallet_address: "address",
    //     })
    //     .await?;

    // dbg!(created);

    let app = Router::new()
        .route("/", get(|| async { "hello, world" }))
        .layer(cors);

    let addr = std::net::SocketAddr::from(([127, 0, 0, 1], 3000));
    tracing::debug!("listening on  {}", addr);
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .expect("failet to start server");

    Ok(())
}
