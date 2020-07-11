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
    var answers: [Answers] = [Answers(text: "", correct: false),
                              Answers(text: "", correct: false)]
    
    var userAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        for answer in self.answers {
            if sender.currentTitle == answer.text {
                if answer.correct == true {
                    DispatchQueue.main.async {
                        sender.backgroundColor = UIColor.green
                        sender.setTitleColor(UIColor.black, for: .normal)
                    }
                } else {
                    DispatchQueue.main.async {
                        sender.backgroundColor = UIColor.red
                        sender.setTitleColor(UIColor.black, for: .normal)
                    }
                }
            }
        }
        userAnswer = sender.currentTitle!
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sendAnswer), userInfo: nil, repeats: false)
    }
    
    @objc func sendAnswer(){
        delegate?.submittedAnswer(answer: userAnswer)
        DispatchQueue.main.async {
            self.button1.backgroundColor = UIColor.black
            self.button1.setTitleColor(UIColor.white, for: .normal)
            
            self.button2.backgroundColor = UIColor.black
            self.button2.setTitleColor(UIColor.white, for: .normal)
        }
    }
}

extension BooleanButtonViewController: GameViewControllerDelegate {
    func clearUI() {
        
    }
    
    func updateUI(answers: [Answers]) {
        self.answers = answers
//        DispatchQueue.main.async {
//            self.button1.setTitle(answers[0].text, for: .normal)
//            self.button2.setTitle(answers[1].text, for: .normal)
//        }
    }
}
