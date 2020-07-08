//
//  ControllerManager.swift
//  TriviaGame
//
//  Created by Bailey Search on 08/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

class ControllerManager {
    var categories: CateogoryData?
    
    func getCategories() {
        if let url = URL(string: "https://opentdb.com/api_category.php") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(CateogoryData.self, from: safeData)
                            self.categories = results
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
