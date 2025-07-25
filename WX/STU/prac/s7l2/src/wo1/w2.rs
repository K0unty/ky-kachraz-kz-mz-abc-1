// ----------------------------------------------------
// Structures and Enums data Types
// Called Data structures
// ----------------------------------------------------

// --- Attributes ---
#![allow(dead_code)]
#![allow(unused_imports)]

// --- Imports ---
use crate::utz::{header, pswg};
use yansi::Paint;

// --- Main function Call

pub fn wo2_main() {
    let maint1 = "wo2.rs - Structs and Enums";
    pswg(maint1.to_string());
    brint_struct();
}

// --- Sub functions Call

// Struct Definitiont
#[derive(Debug)]
struct User {
    name: String,
    email: String,
    active: bool,
}

fn brint_struct() {
    header("Struct User");

    // Note you have to define the stuct like
    let user1 = User {
        name: "PantySmeller".to_string(),
        email: "stink@snigger.com".to_string(),
        active: true,
    };
    println!("Struct User: {:#?}", user1);
    println!("{}", User);
}
