//
//  GameViewController.swift
//  TriviaGame
//
//  Created by Bailey Search on 09/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate {
    func updateUI(answers: [Answers])
    func clearUI()
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var multipleButtonView: UIView!
    @IBOutlet weak var booleanButtonView: UIView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var settingsOptions: SettingsOptions?
    
    var gameManager = GameManager()
        
    var multipleDelegate: GameViewControllerDelegate?
    var booleanDelegate: GameViewControllerDelegate?

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segue.containers.showMultiple {
            let destinationVC = segue.destination as! MultipleButtonViewController //Chose the right view controller. - Downcasting
            destinationVC.delegate = self
            multipleDelegate = destinationVC
            
        } else if segue.identifier == K.segue.containers.showBoolean {
            let destinationVC = segue.destination as! BooleanButtonViewController //Chose the right view controller. - Downcasting
            destinationVC.delegate = self
            booleanDelegate = destinationVC
            
        } else if segue.identifier == K.segue.showEndScreen {
            //let destinationVC = segue.destination as! EndScreenViewController //Chose the right view controller. - Downcasting

            print("Going to end screen now")
        }
    }
    
    @objc func showMultiple(){
        DispatchQueue.main.async {
            self.booleanButtonView.isHidden = true
            self.multipleButtonView.isHidden = false
        }
    }
    
    @objc func showBoolean(){
        DispatchQueue.main.async {
            self.booleanButtonView.isHidden = false
            self.multipleButtonView.isHidden = true
        }
    }
}

//MARK: - GameManagerDelegate
extension GameViewController: GameManagerDelegate {
    func updateUI(uiData: UIData) {
        DispatchQueue.main.async{
            self.questionLabel.text = uiData.question.htmlAttributedString!.string
            self.questionProgressView.setProgress(uiData.percentage, animated: true)
        }
        
        if uiData.type == "multiple" {
            multipleDelegate?.updateUI(answers: uiData.answers)
            showMultiple()
            //Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showMultiple), userInfo: nil, repeats: false)
            
        } else {
            booleanDelegate?.updateUI(answers: uiData.answers)
            showBoolean()
            //Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showBoolean), userInfo: nil, repeats: false)
        }
        
    }
    
    func showEndScreen(){
        self.performSegue(withIdentifier: K.segue.showEndScreen, sender: self)
    }
}

//MARK: - MultipleButtonViewControllerDelegate
extension GameViewController: MultipleButtonViewControllerDelegate, BooleanButtonViewControllerDelegate {
    func submittedAnswer(answer: String) {
        multipleDelegate?.clearUI()
        gameManager.questionAnswer(answer: answer)
    }
}
