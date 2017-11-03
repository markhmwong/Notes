//: Playground - noun: a place where people can play

import UIKit

//  Variables
//  var keyword - Able to change during runtime
var strVar = "Hello, playground"
strVar = "Hellp, this is a new playground"
print(strVar)


//  let keyword - a constant variable. Unable to be modified during runtime

let strConstant = "Hello I can't be changed"
//strConstant = "Error" //compile-time error, the let constant cannot be changed

//  Declaring type - Type Annotations

var aRandomInteger: Int = 5;
print(aRandomInteger);

var aRandomFloat: Float = 5.5;
var aRandomDouble: Double = 5.55;
var aRandomString: String = "This is the Swift programming language!"

//  Printing
print("We concatentate variables with this string with a random double - \(aRandomDouble)");

// Number type bounds
var lowerBounds: UInt8 = UInt8.min;
var upperBounds: UInt8 = UInt8.max;
print("\(lowerBounds) \(upperBounds)");

//  Floating point
//  A 64bit floating point number is a Double

//Numeric Literals
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

print(octalInteger)

//  Type Inference
//  The swift language will infer with the variable has been assigned an initial value. It allows the programmer to not have to specify a type for the variable

//  Booleans
var catIsADog = false;
var catIsACat = true;

//  Tuples
//  Tuples allows us to return multiple values through one variable like an array but not equivalent in functionality. An array generally is declared with a type, though an array allows to return compound values/objects, these are only of one type.
//  Like an annonymous struct
//  Tuples are of fixed length.
//  Makes it possible to associate a name to each parameter.
//  Refactoring type the compiler will pick that up.
//  var (a, b, _, _) - returned values can be ignored

func tupleFunction() -> ([Int], Float32, String) {
    let someInts: [Int] = [1, 2, 3]
    let aFloat: Float32 = 3.3;
    let aString: String = "This is a tuple!";
    return (someInts, aFloat, aString)
}

func tupleFunctionDouble(aDouble: Double) -> ([Int], Float32, String, Double) {
    let someInts: [Int] = [1, 2, 3]
    let aFloat: Float32 = 3.3;
    let aString: String = "This is a tuple!";
    
    let aDoubleDouble = aDouble;
    return (someInts, aFloat, aString, aDoubleDouble)
}

var tuple = tupleFunction()

var (aa, bb, _, _) = tupleFunctionDouble(aDouble: 67.432)
print(tuple)

let spaApp = (title: "How to build a SPA", description: "Build a SPA app using Laravel and VueJS");
print(spaApp)
print(spaApp.title)
print(spaApp.0)



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
//var  multiply: (Int, Int) -> Int = { $0 + $1 }
//
//let y = multiply(5, 7)
//print(y)

