//
//  WeatherManager.swift
//  Clima
//
//  Created by Bailey Search on 30/06/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=dc8a71072369698ec885aa12bd490f8d&units=metric"
    
    func fetchWeather(cityName: String) {
        let queryCityName = cityName.replacingOccurrences(of: " ", with: "+")
        let urlString = weatherURL + "&q=\(queryCityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitute: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitute)"
        performRequest(urlString: urlString)
    }
    
    var delegate: WeatherManagerDelegate?
    
    func performRequest(urlString: String){
        print(urlString)
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task with a closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
           
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
