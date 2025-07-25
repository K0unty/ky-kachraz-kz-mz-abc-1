// ----------------------------------------------------
// Structures and Enums data Types
// Rust Traits
// ----------------------------------------------------

// --- Attributes ---
#![allow(dead_code)]
#![allow(unused_imports)]

// --- Imports ---
use crate::utz::{header, pswg};
use yansi::Paint;

// --- Main function Call

pub fn wo4_main() {
    let maint1 = "wo4.rs - Traits";
    pswg(maint1.to_string());
}

// --- SubF ---

// Defining the trait
trait Summary {
    fn summarize(&self) -> String;
}

struct Article {
    heading: String,
    content: String,
}

impl Summary for Article {
    fn summarize(&self) -> String {
        format!("{}..", &self.content[0..50])
    }
}
