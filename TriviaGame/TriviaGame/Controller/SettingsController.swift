//
//  SettingsView.swift
//  TriviaGame
//
//  Created by Bailey Search on 08/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var numOfQuestionsLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var settingsModel = SettingsModel()
    
    var categories: CateogoryData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        
        print("This is the Category Data \(categories)")
    }
    
    @IBAction func numOfQuestionsStepper(_ sender: UIStepper) {
        numOfQuestionsLabel.text = String(format: "%.0f", sender.value)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}

//MARK: - UIPickerView
extension SettingsController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (categories?.trivia_categories.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories?.trivia_categories[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = categories?.trivia_categories[row].name
        print(selectedCurrency)
    }
}
