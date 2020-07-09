//
//  SettingsViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 08/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class Settings1ViewController: UIViewController {
    
    @IBOutlet weak var stepperValue: UILabel!

    var settingsOptions = SettingsOptions()
    
    @IBOutlet weak var numberOfQuestionsStepper: UIStepper!
    
    let controllerManager = ControllerManager()
    var categories: CateogoryData?

    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfQuestionsStepper.value = 10
        settingsOptions.numberOfQuestions = 10
        
        controllerManager.getCategories()
    }
    @IBAction func stepperChanged(_ sender: UIStepper) {
        settingsOptions.numberOfQuestions = Int(sender.value)
        stepperValue.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        categories = controllerManager.categories
        self.performSegue(withIdentifier: K.segue.showSettings2, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segue.showSettings2 {
            let destinationVC = segue.destination as! Settings2ViewController //Chose the right view controller. - Downcasting
            
            destinationVC.settingsOptions = settingsOptions
            destinationVC.categories = categories
        }
    }
}
