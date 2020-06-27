//
//  Enemy.swift
//  ClassesDemo
//
//  Created by Bailey Search on 27/06/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

class Enemy {
    var health = 100
    var attackStrength = 10
    
    func move(){
        print("Walk forwards")
    }
    
    func attack(){
        print("Does \(attackStrength) damage.")
    }
}
