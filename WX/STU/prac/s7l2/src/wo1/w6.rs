// ----------------------------------------------------
// Error handling
// ----------------------------------------------------

// --- Attributes ---
#![allow(dead_code)]
#![allow(unused_imports)]

// --- Imports ---
use crate::utz::{header, pswg};
use yansi::Paint;

// --- Main function Call

pub fn wo6_main() {
    let maint1 = "wo5.rs - Errors";
    pswg(maint1);
    divide_func();
}

// --- Sub Functions

/*
Errors being defined with traits and structs
*/

fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 {
        Err("bastard".red().to_string(0))
    } else {
        Ok(a / b)
    }
}

fn divide_func() {
    header("Division Function with Error Handling");

    // Success case
    let result1 = divide(10.0, 2.0);
    match result1 {
        Ok(value) => println!("Result: {}", value), // Prints: Result: 5.0
        Err(error) => println!("Error: {}", error),
    }

    // Error case
    let result2 = divide(10.0, 0.0);
    match result2 {
        Ok(value) => println!("Result: {}", value),
        Err(error) => println!("Error: {}", error), // Prints: Error: Cannot divide by zero
    }
}
