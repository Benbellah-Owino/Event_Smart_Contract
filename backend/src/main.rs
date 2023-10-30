#![allow(unused)]
// region:   ---  modules
use axum::extract::{Path, Query};
use axum::http::{Method, Uri};
use axum::response::{Html, IntoResponse, Response};
use axum::routing::{get, get_service, post};
use axum::{middleware, Json, Router};

use tower_http::cors::{Any, CorsLayer};

use sqlx::postgres::PgPoolOptions;

use tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};
// endregion: --- modules

#[tokio::main]
async fn main() {
    let durl = std::env::var("DATABASE_URL").expect("set DATABASE_URL env variable");
    //  region:     --- initiate loging
    tracing_subscriber::registry()
        .with(tracing_subscriber::EnvFilter::new(
            std::env::var("RUST_LOG").unwrap_or_else(|_| "backend=debug".into()),
        ))
        .with(tracing_subscriber::fmt::layer())
        .init();
    //  endregion:  --- initiate loging

    let cors = CorsLayer::new().allow_origin(Any);

    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&durl)
        .await
        .expect("unable to connect to database");

    let app = Router::new()
        .route("/", get(|| async { "hello, world" }))
        .layer(cors);

    let addr = std::net::SocketAddr::from(([127, 0, 0, 1], 3000));
    tracing::debug!("listening on  {}", addr);
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .expect("failet to start server");
}
