// ----------------------------------------------------
// Main Work in here
// ----------------------------------------------------

// --- Attributes ---
#![allow(dead_code)]

// --- Imports ---
use crate::utz::{header, pswg};
use yansi::Paint;

// --- Main function Call

pub fn wo1_main() {
    pswg("Wo1 Work:".to_string());
    // lop1()
    // lop2();
    mat1();
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

// Match staement like swith case

fn mat1() {
    header("Match Tests");

    let number = 2;

    match number {
        1 => println!("{}", "one".green()),
        2 => println!("Number Matched - {}", "Two".blue()),
        _ => println!("{}", "No Matchnumber".red()),
    }
}
