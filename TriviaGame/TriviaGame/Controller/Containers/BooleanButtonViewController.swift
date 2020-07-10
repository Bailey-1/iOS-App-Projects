//
//  BooleanButtonViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 09/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

protocol BooleanButtonViewControllerDelegate {
    func submittedAnswer(answer: String)
}

class BooleanButtonViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var delegate: BooleanButtonViewControllerDelegate?
    var answers: [String] = ["", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        delegate?.submittedAnswer(answer: sender.currentTitle!)
    }
    
}

extension BooleanButtonViewController: GameViewControllerDelegate {
    func updateUI(answers: [String]) {
        DispatchQueue.main.async {
            self.button1.setTitle(answers[0], for: .normal)
            self.button2.setTitle(answers[1], for: .normal)
        }
    }
}
