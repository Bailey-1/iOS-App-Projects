//
//  GameViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 09/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var multipleButtons: UIView!
    @IBOutlet weak var booleanButtons: UIView!
    
    @IBOutlet var additionalButtons: [UIButton]!
    
    
    var settingsOptions: SettingsOptions?
    
    // Hide navigationbar on the welcome screen
    override func viewWillAppear(_ animated: Bool) {
        // Always call super when overiding method from the super class
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // Unhide the navigation bar to show it on other screens
    override func viewWillDisappear(_ animated: Bool) {
        // Always call super when overiding method from the super class
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multipleButtons.isHidden = true
        //print("FINAL DATA: \n\(settingsOptions)")
    }
    
    @IBAction func optionButtonPressed(_ sender: UIButton) {
        //print(sender.currentTitle)
        booleanButtons.isHidden = !booleanButtons.isHidden
        multipleButtons.isHidden = !multipleButtons.isHidden

    }
}
