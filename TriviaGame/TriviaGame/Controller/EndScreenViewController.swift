//
//  EndScreenViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 10/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class EndScreenViewController: UIViewController {
    
    var correctNumber: Int?
    var total: Int?
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeCorrectNumber = correctNumber {
            if let safeTotal = total {
                scoreLabel.text = "\(safeCorrectNumber)/\(safeTotal)"
            }
        }
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        //self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        
    }
}
