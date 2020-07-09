//
//  GameManager.swift
//  TriviaGame
//
//  Created by Bailey Search on 09/07/2020.
//  Copyright © 2020 Bailey Search. All rights reserved.
//

import Foundation

protocol GameManagerDelegate {
    func updateUI()
}

class GameManager {
    
    var delegate: GameManagerDelegate?
    
    var quizData: QuizData?
    
    var settingsOptions: SettingsOptions?
    
    var currentQuestion: QuestionData?
    var currentQuestionNumber: Int = 0
    
    func fetchQuizData(settingsOptions: SettingsOptions){
        let quizURL = generateURL(settingsOptions: settingsOptions)
        self.settingsOptions = settingsOptions
        
        if let url = URL(string: quizURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(QuizData.self, from: safeData)
                            self.quizData = results
                            //print(results)
                            self.nextQuestion()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func nextQuestion(){
        
        // Check the current number is under the max
        if let safeNumberOfQuestions = settingsOptions?.numberOfQuestions {
            if currentQuestionNumber < safeNumberOfQuestions {
                
                // Increment the current question
                currentQuestion = quizData?.results[currentQuestionNumber]
            }
        }
        
    }
    
    func generateURL(settingsOptions: SettingsOptions) -> String {
        var baseURL = "https://opentdb.com/api.php?"
        
        baseURL += "amount=\(settingsOptions.numberOfQuestions)"
        
        if settingsOptions.category != 0 {
            baseURL += "&category=\(settingsOptions.category)"
        }
        
        if let safeDifficulty = settingsOptions.difficulty {
            baseURL += "&difficulty=\(safeDifficulty)"
        }
        
        if let safeType = settingsOptions.type {
            baseURL += "&type=\(safeType)"
        }
        
        print("BASEURL: \(baseURL)")
        return baseURL
    }
}
