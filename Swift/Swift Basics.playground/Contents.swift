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

//  Optionals
//  Used when a value may be absent and allows for our constant or variable to have no value.
//  It may contain a value of type or it may be nil
let possibleNumber = "123"
let convertedNumber: Int? = Int(possibleNumber)
print(convertedNumber) //Optional(123)
//  Nil

var noValue: Int? = 123
noValue = nil
var automaticNilValue: String?
print(automaticNilValue)

//  Forced unwrapping
let possibleNumberr = "123"
let convertedNumberr: Int? = Int(possibleNumberr)
print(convertedNumberr!) //123

//  Optional Binding
//  Used to check whether an optional contains a value.

if let x = Int(possibleNumber) {
    print("\(x)")
}
else {
    print("\"\(x)\" not a number")
}

//  we can also use a comma to evaluated multiple optionals
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

//  Implicity Unwrapped Optionals
//  If we use implict unwrapping, there isn't a need to unwrap the string after the variable has been declared as an optional. Using an exclamation mark during declaration (on the type), it allows us to assume the variable as a String without additional annonatation.

//I.e. We can do this
let assumedString: String! = "An implicity unwrapped optional string";
let implicitString: String = assumedString
//rather than
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
// for conditionals, we can still allow for the implicitly unwrapped optional to be treated as a standard optional variable.

//  Error handling - try catch. Similar to Java
//  also read up on try, try?, try! T_T https://medium.com/@JoyceMatos/error-handling-in-swift-3-try-try-and-try-f19705e32ff4

enum DivisionError: Error {
    case DivideByZero
}

func divide(num1: Float, num2: Float) throws -> Float {
    guard num2 != 0.0 else {
        throw DivisionError.DivideByZero
    }
    return num1 / num2
}

do {
    try divide(num1: 4, num2: 0)
} catch is DivisionError {
    //} catch DivisionError.DivideByZero
    print("can't divide by zero")
    let errorStr = DivisionError.DivideByZero;
    print(errorStr)
}

//  Assertions
//  Assertions are used for debugging to quickly check your code for errors
let x = 14;
assert (x >= 13, "A teenager has to be above or equal to 13");

//  Enforcing Preconditions
//  Preconditions are used in the case where the value has a potential to be false. Great to use if the client has given valid parameters
// In the implementation of a subscript...
precondition(index > 0, "Index must be greater than zero.")



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

