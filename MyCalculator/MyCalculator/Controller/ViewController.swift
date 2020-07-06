//
//  ViewController.swift
//  MyCalculator
//
//  Created by Bailey Search on 05/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet var operators: Array<UIButton>?
    
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = String(calculatorBrain.total)
        // Do any additional setup after loading the view.
    }
    
    // Used to build the string.
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        // First Number
        if calculatorBrain.currentOperator == nil {
            calculatorBrain.total += sender.currentTitle!
            resultsLabel.text = calculatorBrain.total
            
        // if an operator is selected - second number
        } else {
            // Continue the calculation from the currently displayed answer
            if calculatorBrain.total == "" {
                calculatorBrain.total = resultsLabel.text!
            }
            clearOperators()
            calculatorBrain.secondNumber += sender.currentTitle!
            resultsLabel.text = calculatorBrain.secondNumber
        }
        print("Total: \(calculatorBrain.total)")
        print("Second: \(calculatorBrain.secondNumber)")
        print("Operator: \(calculatorBrain.currentOperator ?? "Nil")")
    }
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        // UI Stuff
        clearOperators()
        sender.backgroundColor = UIColor.white
        sender.setTitleColor(UIColor.orange, for: .normal)
        
        if let currentOperator = sender.currentTitle {
            calculatorBrain.currentOperator = currentOperator
            
            // Do subcalculation so you dont always have to press =
            if calculatorBrain.total != "" && calculatorBrain.secondNumber != "" {
                resultsLabel.text = calculatorBrain.calculate()
                calculatorBrain.currentOperator = currentOperator
            }
        }
        
        print("Total: \(calculatorBrain.total)")
        print("Second: \(calculatorBrain.secondNumber)")
        print("Operator: \(calculatorBrain.currentOperator ?? "Nil")")
    }
    
    
    @IBAction func ACButton(_ sender: UIButton) {
        calculatorBrain.clear()
        clearOperators()
        resultsLabel.text = ""
        
    }
    
    @IBAction func equalsPressed(_ sender: UIButton?) {
        clearOperators()
        resultsLabel.text = calculatorBrain.calculate()
    }
    
    func clearOperators(){
        for button in operators! {
            button.backgroundColor = UIColor.orange
            button.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
}
