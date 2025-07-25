// ----------------------------------------------------
// Main Work in here
// ----------------------------------------------------

// --- Attributes ---
#![allow(dead_code)]

// --- Imports ---
use crate::utz::pswg;
use yansi::Paint;

// --- Main function Call

pub fn wo1_main() {
    // lop1()
    lop2();
}

// --- Sub functions Call

fn lop1() {
    let t1 = "Lopsa Tests";
    pswg(t1.to_string());

    // Loops test
    let line = "~".repeat(20);
    let mut n = 10;
    while n > 0 {
        println!("{}", line);
        println!("This: {}", n.blue());
        n -= 2;
    }
}

fn lop2() {
    let t2 = "Lopsa Tests 2";
    pswg(t2.to_string());

    // Loops test
    let line = "~".repeat(20);
    for n in (0..5).rev() {
        println!("{}", line);
        println!("This: {}", n.blue());
    }
}
