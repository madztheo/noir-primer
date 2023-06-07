use dep::std;

global SAMPLE_CONSTANT = 10;

fn nonMutableVars() {
    let mut x = 10;
    // Will fail as x is not mutable
    x = 20;
}

fn mutableVars() {
    let mut x = 10;
    x = 20;
    assert(x == 20);
}

fn integerTypes() {
    // Max size of u32
    let mut a: u32 = (2.pow_32(32) - 1) as u32;
    // Will output 2^32 - 1
    std::println([a]);
    // Out of bounds: doesn't throw an error but wraps around
    a = 2.pow_32(32) as u32;
    // Will out put 0 -> 2^32 % 2^32 = 0
    std::println([a]); 
    assert(a == 0);
    // Max size of u64 (also biggest uint type)
    let mut b: u64 = (2.pow_32(64) - 1) as u64;
    // Will output 2^64 - 1
    std::println([b]);
    // Out of bounds: doesn't throw an error but wraps around
    b = (2.pow_32(64) + 1) as u64;
    // Will out put 1 -> (2^64 + 1) % 2^64 = 1
    std::println([b]);
    assert(b == 1);
}

fn booleanTypes() {
    let a = true;
    let b = false;
    // Will output true/1
    std::println(a);
    // Will output false/0
    std::println(b);
}

// String types are fixed size
fn stringTypes(message: str<12>) {
    let mut a = "Hello World";
    // Will output Hello World
    std::println(a);
    assert(a == "Hello World");
    a = "Hello Here!";
    // Will output Hello Here!
    std::println(a);
    assert(a == "Hello Here!");
    // Will output Hello again!
    std::println(message);
    // Uncomment this and the function will fail to execute
    // as you can't change the length of the string, it has
    // to be exactly the number of characters specified
    // a = "Hello Here";

    // However you could just fill it with spaces or underscores
    // to mark the non used characters
    a = "Hello______";
    std::println(a);
}

fn arrays() {
    let a: [Field; 5] = [5, 2, 1, 4, 3];
    std::println(a);
    // Print the first element 1
    std::println([a[0]]);
    // Print the last element 5
    std::println([a[4]]);
    assert(a[0] == 5);
    assert(a[4] == 3);
    assert(a.len() == 5);
    // Sort in ascending order
    let asc_array = a.sort_via(|a, b| a < b);
    std::println(asc_array);
    assert(asc_array[0] == 1);
    assert(asc_array[4] == 5);
    // Sort in descending order
    let desc_array = a.sort_via(|a, b| a > b);
    std::println(desc_array);
    assert(desc_array[0] == 5);
    assert(desc_array[4] == 1);
    // Multiply every element in the array by 3
    let multiplied_array = a.map(|x| x * 3);
    std::println(multiplied_array);
    assert(multiplied_array[0] == 15);
    assert(multiplied_array[4] == 9);
    // Sum all the elements in the array
    let mut sum = a.fold(0, |acc, x| acc + x);
    assert(sum == 15);
    // Sum all the elements in the array
    // Same as fold but uses the first element as starting value
    sum = a.reduce(|acc, x| acc + x);
    assert(sum == 15);
    // Check if all elements are greater than 0
    let all_greater_than_zero = a.all(|x| x > 0);
    assert(all_greater_than_zero);
    // Check if any element is equal to 5
    let any_equal_to_five = a.any(|x| x == 5);
}

fn tuples() {
    let tup: (u8, u64, Field) = (255, 500, 1000);
    assert(tup.0 == 255);
    assert(tup.1 == 500);
    assert(tup.2 == 1000);
    let (first, second, third) = tup;
    assert(first == 255);
    assert(second == 500);
    assert(third == 1000);
}

struct Point {
    x: u32,
    y: u32,
}

impl Point {
    fn sum(self) -> u32 {
        self.x + self.y
    }
}

fn structs() {
    let mut point = Point { x: 10, y: 20 };
    assert(point.x == 10);
    assert(point.y == 20);
    point.x = 20;
    assert(point.x == 20);
    assert(point.y == 20);
    assert(point.sum() == 40);
}

fn main() {
    // Will print 10 (0x0a)
    std::println(SAMPLE_CONSTANT);
    // Uncomment the following lines to run the examples
    //nonMutableVars();
    //mutableVars();
    //integerTypes();
    //booleanTypes();
    //stringTypes("Hello again!");
    //arrays();
    //tuples();
    //structs();
}