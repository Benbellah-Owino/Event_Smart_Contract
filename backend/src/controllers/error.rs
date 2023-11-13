use serde::Serialize;

pub type Result<T> = core::result::Result<T, Error>;


#[serde_as]
#[derive(Debug, Serialize)]
pub enum Error{
    EntityNotFound{entity:&'static str, id:&'static str},
    DuplicateEntityInDB
}
