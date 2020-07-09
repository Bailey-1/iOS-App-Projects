//
//  SettingsModel.swift
//  TriviaGame
//
//  Created by Bailey Search on 08/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

protocol SettingsModelDelegate {
}

struct SettingsModel {
    

}

struct SettingsOptions {
    var numberOfQuestions: Int = 10
    var difficulty: String?
    var category: Int = 0
    var type: String?
}
