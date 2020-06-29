//
//  main.swift
//  Optionals
//
//  Created by Bailey Search on 29/06/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

var myOptional: String?
myOptional = "stuff"

// Force unwrap with lil check
if myOptional != nil {
    let text: String = myOptional!
}

//Optional Binding
// Run block if optional is not nil and assign the String? value to a String.
if let safeOptional = myOptional {
    print(safeOptional)
}

//Nil Coalescing Operator
//Check if optional isn't nil, if it is not nill it will use that value, if it is nill it will use a default value.

var text:String = myOptional ?? "Default value"

print("Text 1: \(text)")

myOptional = nil

text = myOptional ?? "Default value"

print("Text 2: \(text)")

struct MyOptionalStruct {
    var property = 123
    
    func method() {
        print("Method function")
    }
}

// Optional Struct
let myOptionalStruct: MyOptionalStruct?

myOptionalStruct = MyOptionalStruct()

// Optional Chaining
//If variable is not nill - continue down the chain else skip.
print(myOptionalStruct?.property)
myOptionalStruct?.method()
