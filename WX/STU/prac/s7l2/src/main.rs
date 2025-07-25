// ------------------------------------------
// Main Entry point
// ------------------------------------------

// --- Imports ---

mod utz;
mod wo1;

use wo1::w4::wo4_main;

// --- Function calls ---
fn main() {
    wo4_main();
}

// ---Sub Functions---

trait Summay {
    fn summarize(&self) -> String;
}
