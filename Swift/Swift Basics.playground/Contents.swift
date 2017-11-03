//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let https404Error = (404, "Not found");

print(https404Error);

let (a, b) = https404Error;

print(a);
print(https404Error.0);

//value? may contain no value at all
let x = 14;
assert (x >= 13, "A teenager has to be above or equal to 13");


//declaring a closure
//name - multiply
//accepts two ints - (Int, Int)
//returns one Int - -> Int
//signature - (int, Int) -> Int
//closure definition { $0 * $1 }
//$0, $1, $2.... shorthand for parameters
//var  multiply: (Int, Int) -> Int = { (a: Int, b: Int) in return a * b }
//var  multiply: (Int, Int) -> Int = { return $0 * $1 }
var  multiply: (Int, Int) -> Int = { $0 + $1 }

let y = multiply(5, 7)
print(y)
