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
            total = String(Double(total)! + Double(secondNumber)!)
            break
            
        case "-":
            total = String(Double(total)! - Double(secondNumber)!)
            break
            
        case "X":
            total = String(Double(total)! * Double(secondNumber)!)
            break
            
        case "/":
            total = String(Double(total)! / Double(secondNumber)!)
            break
            
        default:
            print("ERROR")
            break
        }
        
        secondNumber = ""
        currentOperator = nil
        
        print("Total: \(total)")
        print("Second: \(secondNumber)")
        print("Operator: \(currentOperator ?? "Nil")")
        return total;
    }
    
    mutating func clear(){
        total = "";
        secondNumber = ""
        currentOperator = nil
    }
}
