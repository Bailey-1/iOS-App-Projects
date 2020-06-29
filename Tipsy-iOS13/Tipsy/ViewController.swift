//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalPeople: Int = 2
    var percentage: Float = 1.1
    var tipSize: String = "10%"
    var price: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        switch sender.currentTitle {
        case "0%":
            percentage = 1.0
            tipSize = "0%"
            
        case "10%":
            percentage = 1.1
            tipSize = "10%"

        case "20%":
            percentage = 1.2
            tipSize = "20%"

        default:
            print("ERROR")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)

        totalPeople = Int(sender.value)
        splitNumberLabel.text = String(totalPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billTextField.text!)
        if let safeBill = Float(billTextField.text!) {
            price = (safeBill * percentage) / Float(totalPeople)
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController //Chose the right view controller. - Downcasting
            
            destinationVC.price = String(format: "%.2f", price)
            destinationVC.settings = "Split between \(totalPeople) people, with \(tipSize) tip."
        }
    }
}

