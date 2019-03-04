//
//  WeatherItem.swift
//  WiproWeather
//
//  Created by Pedro Remedios on 28/02/2019.
//  Copyright © 2019 Pedro Remedios. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherItem {
    var date: String
    var temperature: Int
    var windSpeed: Double
    var description: String
    var icon: URL
    
//    init(date: Double, temperature: Double, icon: String) {
//        self.temperature = Int(temperature - 273.15)
//        self.icon = URL(string: "http://openweathermap.org/img/w/\(icon).png")!
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        self.date = dateFormatter.string(from: NSDate(timeIntervalSince1970: date) as Date)
//
//    }
    
    
    init(with json:JSON) {
        self.temperature = Int(json["main"]["temp"].doubleValue - 273.15)
        self.windSpeed = json["wind"]["speed"].doubleValue
        self.description = json["weather"][0]["description"].stringValue
        self.icon = URL(string: "http://openweathermap.org/img/w/\(json["weather"][0]["icon"].stringValue).png")!
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.date = dateFormatter.string(from: NSDate(timeIntervalSince1970: json["dt"].doubleValue) as Date)
    }
    
}
