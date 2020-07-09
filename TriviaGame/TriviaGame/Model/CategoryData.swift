//
//  CategoryData.swift
//  TriviaGame
//
//  Created by Bailey Search on 08/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

struct CateogoryData: Decodable {
    var trivia_categories: [Category]
}

struct Category: Decodable {
    let id: Int
    let name: String
}
