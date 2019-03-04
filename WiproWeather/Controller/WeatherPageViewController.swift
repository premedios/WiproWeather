//
//  ViewController.swift
//  WiproWeather
//
//  Created by Pedro Remedios on 27/02/2019.
//  Copyright © 2019 Pedro Remedios. All rights reserved.
//

import UIKit

class WeatherPageViewController: UIPageViewController {

    var weatherViewControllers = [WeatherViewController]()
    var weatherPageDataSource: WeatherPageDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 150/255, blue: 255/255, alpha: 1)
        let modelController = WeatherModelController()
        modelController.getWeatherData(for: "Oeiras,pt") { weatherData in
            weatherData?.forEach({ (item) in
                let weatherViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: WeatherViewController.self)) as! WeatherViewController
                weatherViewController.weatherItem = item
                self.weatherViewControllers.append(weatherViewController)
            })
            self.setViewControllers([self.weatherViewControllers[0]], direction: .forward, animated: false)
            self.weatherPageDataSource = WeatherPageDataSource(with: self.weatherViewControllers)
            self.dataSource = self.weatherPageDataSource
        }
    }


}
