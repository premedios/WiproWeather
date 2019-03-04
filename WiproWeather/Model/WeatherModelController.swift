//
//  WeatherModelController.swift
//  WiproWeather
//
//  Created by Pedro Remedios on 27/02/2019.
//  Copyright © 2019 Pedro Remedios. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherModelController {
    private let APIKey = "99423cba71dcb3f60ac004d8d3cbf2a3"
    private var weatherData = [WeatherItem]()
    
    func getWeatherData(for cityCountry: String, onCompletion: @escaping ([WeatherItem]?) -> Void) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast?APPID=\(APIKey)&q=\(cityCountry)").responseJSON { (response) in
            if let value = response.result.value {
                var seenDates = [String]()
                let realJSON = JSON(value)
                let weatherDataList = realJSON["list"]
                for (_, jsonData):(String, JSON) in weatherDataList {
                    let weatherItem = WeatherItem(with: jsonData)
                    if !seenDates.contains(weatherItem.date) {
                        seenDates.append(weatherItem.date)
                        self.weatherData.append(weatherItem)
                    }
                }
                onCompletion(self.weatherData)
            }
            onCompletion(nil)
        }
    }
}
