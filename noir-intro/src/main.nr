fn main(x : u32, y : pub u32) -> pub u32 {
    // Check that the private input x is above or equal to the public input y
    // It could be for example be for an age check
    // Check that you are above a certain age y by providing your age x
    // The age x is private, but the age limit y is public
    assert(x >= y);
    // Returns the age limit (not that useful, but it's just an example)
    // From the perspective of the verifier the return value is a public input
    // so it will be needed to verify the proof
    y
}

#[test]
fn test_main() {
    // Will work just fine as 20 is above 18
    main(20, 18);

    // Uncomment to make test fail
    // main(17, 18);
}
