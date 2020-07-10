//
//  MultipleButtonsViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 09/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

protocol MultipleButtonViewControllerDelegate {
    func submittedAnswer(answer: String)
}

class MultipleButtonViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    var delegate: MultipleButtonViewControllerDelegate?
    var answers: [String] = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        delegate?.submittedAnswer(answer: sender.currentTitle!)
    }
}

extension MultipleButtonViewController: GameViewControllerDelegate {
    func updateUI(answers: [String]) {
        DispatchQueue.main.async {
            self.button1.setTitle(answers[0], for: .normal)
            self.button2.setTitle(answers[1], for: .normal)
            self.button3.setTitle(answers[2], for: .normal)
            self.button4.setTitle(answers[3], for: .normal)
        }
    }
}
