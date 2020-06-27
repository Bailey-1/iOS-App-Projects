//
//  Dragon.swift
//  ClassesDemo
//
//  Created by Bailey Search on 27/06/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String){
        print("Says: \(speech)")
    }
    
    override func move() {
        print("Flys forwards")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire and does \(attackStrength) damage")
    }
}
