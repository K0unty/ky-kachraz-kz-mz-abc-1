// ----------------------------------------------------
// Structures and Enums data Types
// Ownership Stuff
// ----------------------------------------------------

// --- Attributes ---
#![allow(dead_code)]
#![allow(unused_imports)]

// --- Imports ---
use crate::utz::{header, pswg};
use yansi::Paint;

// --- Main function Call

pub fn wo3_main() {
    let maint1 = "wo3.rs - Ownerships";
    pswg(maint1.to_string());
    error1();
}

// --- Sub functions Call

/*
This function will deliberately show the ownership error
*/

fn error1() {
    header("Ownership Error Test");
}
