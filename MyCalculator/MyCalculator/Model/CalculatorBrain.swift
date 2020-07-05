//
//  CalculatorBrain.swift
//  MyCalculator
//
//  Created by Bailey Search on 05/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

struct CalculatorBrain {
        
    var total: String = "";
    var secondNumber: String = "";
    
    var currentOperator: String? = nil
    
    mutating func calculate() -> String {
        
        switch currentOperator {
        case "+":
            total = Double(firstNumber)! + Double(secondNumber)!
            break
        default:
            print("ERROR")
            break
        }
        
        currentOperator = ""
        firstNumber = ""
        secondNumber = ""
        
        return String(total);
    }
}
