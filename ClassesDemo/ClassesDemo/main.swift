//
//  main.swift
//  ClassesDemo
//
//  Created by Bailey Search on 27/06/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

print("Hello, World!")

let skeleton = Enemy()

print(skeleton.health)

let dragon = Dragon()
dragon.attack()
dragon.move()
dragon.talk(speech: "Hello")
