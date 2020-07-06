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
    
    var lastButtonPressed: UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = "0"
        calculatorBrain.delegate = self
    }
    
    // Used to build the string.
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        // reset for new calculation
        calculatorBrain.numButtonPressed(buttonText: sender.currentTitle!)
        printInfo()
        lastButtonPressed = sender
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        // UI Stuff
        if let buttonText = sender.currentTitle {
            calculatorBrain.operationButtonPressed(buttonText: buttonText)
        }
        
        sender.backgroundColor = UIColor.white
        sender.setTitleColor(UIColor.orange, for: .normal)

        printInfo()
        lastButtonPressed = sender
    }
    
    
    @IBAction func ACButton(_ sender: UIButton) {
        calculatorBrain.clear()
        lastButtonPressed = sender
        printInfo()
    }
    
    // Optional because it is used to clear some stuff
    @IBAction func equalsPressed(_ sender: UIButton?) {
        calculatorBrain.equalsCalculate()
        lastButtonPressed = sender
    }
    
    @IBAction func invertNumPressed(_ sender: UIButton) {
        calculatorBrain.invertNumber()
        lastButtonPressed = sender
    }
    
    @IBAction func percentageButton(_ sender: UIButton) {
        calculatorBrain.percentage()
        lastButtonPressed = sender
    }
    
    func printInfo() {
        print("Total: \(calculatorBrain.total)")
        print("Second: \(calculatorBrain.secondNumber)")
        print("Operator: \(calculatorBrain.currentOperator ?? "Nil")")
    }
}

extension ViewController: CalculatorBrainDelegate {
    func getLastButtonText() -> String {
        return (lastButtonPressed?.currentTitle ?? "")
    }
    
    func getResultsLabelVal() -> String {
        return resultsLabel.text!
    }
    
    func updateResultsLabel(result: String) {
        resultsLabel.text = result
    }
    
    func clearOperatorsUI(){
        for button in operators! {
            button.backgroundColor = UIColor.orange
            button.setTitleColor(UIColor.white, for: .normal)
        }
    }
}
