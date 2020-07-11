//
//  EndScreenViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 10/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class EndScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        
    }
}
