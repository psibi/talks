---
author: Sibi Prabakaran
title: Rust
date: ILUGC, Oct 10, 2020
---

# Agenda

* My experience with Rust
* Introduction to Rust
* Why Rust

# My experience

- [https://crates.io/crates/credstash](https://crates.io/crates/credstash)
- Embedded programming
  - STM32F3 Microcontroller
- Some work in my day job

# Rust

# Heap and Stack

- Heap: Memory set aside for dynamic allocation.
- Stack: Memory set aside for a thread.

# Ownership rules

* Each value in Rust has a variable that’s called its owner.
* There can only be one owner at a time.
* When the owner goes out of scope, the value will be dropped.

``` rust
{
    let s1 = String::from("hello ilugc"); // s1 is valid from this point forward

    // do stuff with s1
}                                  // this scope is now over, and s1 is no
                                   // longer valid
```

# Data interaction

``` rust
fn main() {
    let x: i32 = 5;
    let y = x;
    println!("Output: {} {}", x, y);
}
```

``` rust
fn main() {
    let x = String::from("hello ilugc");
    let y = x;
    println!("Output: {} {}", x, y);
}
```

# Ownership

``` rust
fn main() {
    let s = String::from("hello");  // s comes into scope

    takes_ownership(s);             // s's value moves into the function...
                                    // ... and so is no longer valid here

    let x = 5;                      // x comes into scope

    makes_copy(x);                  // x would move into the function,
                                    // but i32 is Copy, so it’s okay to still
                                    // use x afterward

} // Here, x goes out of scope, then s. But because s's value was moved, nothing
  // special happens.

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("{}", some_string);
} // Here, some_string goes out of scope and `drop` is called. The backing
  // memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("{}", some_integer);
} // Here, some_integer goes out of scope. Nothing special happens.
```

# References

``` rust
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
```

# References (2)

``` rust
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

# Snippet 1

``` rust
fn main() {
    let mut x = String::from("ilugc");

    let r1 = &mut x;
    let r2 = &mut x;

    println!("{}", r1);
}
```

# Snippet 2

``` rust
fn main() {
    let mut x = String::from("ilugc");

    let r1 = &x;
    let r2 = &mut x;

    println!("{}", r1);
}
```

# Snippet 3

``` rust
use std::thread;

fn main() {
    let v = vec![1, 2, 3];

    let handle = thread::spawn(|| {
        println!("Here's a vector: {:?}", v);
    });

    handle.join().unwrap();
}
```

# Hard parts

- Learning curve
- Embedded ecosystem not mature yet.
- Scientific libraries.

# Why Rust

- Compile time guarantees
- Zero cost abstraction
- No exceptions. So easy FFI integration.
- Error messages
- Community

# Learning resources

- Rust book
- OReily's book
- Embedded book

# Questions


