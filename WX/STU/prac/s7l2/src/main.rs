// ------------------------------------------
// Main Entry point
// ------------------------------------------

// --- Imports ---

mod utz;
mod wo1;

use wo1::w5::wo5_main;

// --- Function calls ---
fn main() {
    wo5_main();
}

// ---Sub Functions---

/*
Life-Times test
*/

fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}

let string = String::from(" Long String is Panty");

