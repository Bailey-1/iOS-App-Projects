//
//  main.swift
//  Protocols
//
//  Created by Bailey Search on 30/06/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

// Use a protocol to link a behaviour
protocol CanFly {
    func fly()
}


class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("bird lays eggs")
        }
    }
}

// Class is required because of inheritence of bird superclass
class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle can fly")
    }
    
    
    func soar() {
        print("The eagle soars")
    }
}

// Penguin can of course not fly
class Penguin: Bird {
    func swim() {
        print("The penguin swims")
    }
}

// Use a protocol as a data type to ensure that it can fly
struct FlyingDisplay {
    func demo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

// Protocols arent ineherited so you can use a struct
struct aeroplane: CanFly {
    func fly() {
        print("The plane flys away")
    }
}


let myEagle = Eagle()

let myPenguin = Penguin()

let myAeroplane = aeroplane()

let myShow = FlyingDisplay()
myShow.demo(flyingObject: myEagle)
myShow.demo(flyingObject: myAeroplane)
//myShow.demo(flyingObject: myPenguin) - Doesnt work cause penguins dont have fly protocol
