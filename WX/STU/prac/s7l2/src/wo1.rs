// ----------------------------------------------------
// Main Work in here
// ----------------------------------------------------

// --- Imports ---
use crate::utz::pswg;
use yansi::Paint;

// --- Main function Call

pub fn wo1_main() {
    lop1()
}

// --- Sub functions Call

fn lop1() {
    let t1 = "Lopsa Tests";
    pswg(t1.to_string());

    let mut n = 3;
    while n>0 {
        println!("This: {}", n);
        n -=1;
    }

}
