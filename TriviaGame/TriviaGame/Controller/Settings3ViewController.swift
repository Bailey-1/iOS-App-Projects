//
//  Settings3ViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 08/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class Settings3ViewController: UIViewController {

    var settingsOptions: SettingsOptions?

    @IBOutlet var allDifficultyButtons : [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(settingsOptions)
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        var questionTypeSelected: String?
        
        switch(sender.selectedSegmentIndex) {
        case 0:
            break
            
        case 1:
            questionTypeSelected = "multiple"
            break
            
        case 2:
            questionTypeSelected = "boolean"
            break
        default:
            print("ERROR")
        }
        
        settingsOptions?.type = questionTypeSelected
    }
    
    @IBAction func difficultyButtonPressed(_ sender: UIButton) {
        
        for button in allDifficultyButtons {
            button.backgroundColor = UIColor.lightGray
            button.setTitleColor(UIColor.white, for: .normal)
        }
        
        sender.backgroundColor = UIColor.blue
        sender.setTitleColor(UIColor.black, for: .normal)
        
        settingsOptions?.difficulty = sender.currentTitle!
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.segue.showGame, sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segue.showGame {
            let destinationVC = segue.destination as! GameViewController //Chose the right view controller. - Downcasting
            destinationVC.settingsOptions = settingsOptions
        }
    }
}
