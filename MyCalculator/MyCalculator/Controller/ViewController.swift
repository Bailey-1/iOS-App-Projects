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
        // if no operator is selected
//        if calculatorBrain.currentOperator == nil {
//            calculatorBrain.secondNumber += sender.currentTitle!
//            resultsLabel.text = calculatorBrain.secondNumber
//        } else {
//            // if an operator is selected
//            calculatorBrain.firstNumber += sender.currentTitle!
//            resultsLabel.text = calculatorBrain.firstNumber
//        }
//        print("FirstNum: \(calculatorBrain.firstNumber )")
//        print("SecondNum: \(calculatorBrain.secondNumber )")
        
        if calculatorBrain.currentOperator == nil {

    }
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        // UI Stuff
        for button in operators! {
            button.backgroundColor = UIColor.orange
            button.setTitleColor(UIColor.white, for: .normal)
        }
        
        sender.backgroundColor = UIColor.white
        sender.setTitleColor(UIColor.orange, for: .normal)
        
        
        if let currentOperator = sender.currentTitle {
            calculatorBrain.currentOperator = currentOperator
        }
    }
    
    
    @IBAction func ACButton(_ sender: UIButton) {
        calculatorBrain.total = 0.0;
        calculatorBrain.firstNumber = ""
        calculatorBrain.secondNumber = ""
        resultsLabel.text = calculatorBrain.firstNumber
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        for button in operators! {
            button.backgroundColor = UIColor.orange
            button.setTitleColor(UIColor.white, for: .normal)
        }
        resultsLabel.text = calculatorBrain.calculate()
    }
    
}

