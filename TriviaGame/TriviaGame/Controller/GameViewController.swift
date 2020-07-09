//
//  GameViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 09/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var multipleButtonView: UIView!
    
    @IBOutlet weak var booleanButtonView: UIView!
    
    var settingsOptions: SettingsOptions?
    
    var gameManager = GameManager()
    
    // Hide navigationbar on the welcome screen
    override func viewWillAppear(_ animated: Bool) {
        // Always call super when overiding method from the super class
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        gameManager.delegate = self
    }
    
    // Unhide the navigation bar to show it on other screens
    override func viewWillDisappear(_ animated: Bool) {
        // Always call super when overiding method from the super class
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("FINAL DATA: \n\(settingsOptions)")
        if let safeSettingsOptions = settingsOptions {
            print(safeSettingsOptions)
            gameManager.fetchQuizData(settingsOptions: safeSettingsOptions)
        }
    }
    
    @IBAction func optionButtonPressed(_ sender: UIButton) {
        //print(sender.currentTitle)

    }
}

extension GameViewController: GameManagerDelegate {
    func updateUI() {
        
    }
}
