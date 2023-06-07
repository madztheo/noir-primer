use dep::std;

fn loop() {
    let mut x = 0;
    for i in 0..10 {
        x += 1;
    }
    assert(x == 10);
}

fn conditions(x: u32) {
    let mut i = 0;
    if x > 10 {
        i = 1;
    } else {
        i = 2;
    }
    std::println([i]);
}

fn main() {
    loop();
    conditions(5);
    conditions(15);
}