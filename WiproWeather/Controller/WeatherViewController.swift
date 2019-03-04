//
//  WeatherPageViewController.swift
//  WiproWeather
//
//  Created by Pedro Remedios on 01/03/2019.
//  Copyright © 2019 Pedro Remedios. All rights reserved.
//

import UIKit
import AlamofireImage

class WeatherViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    var weatherItem: WeatherItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = self.weatherItem {
            self.temperatureLabel.text = "\(viewModel.temperature)"
            if let url = URL(string: viewModel.icon.absoluteString) {
                self.weatherIcon.af_setImage(withURL: url)
            }
            self.windSpeed.text = "\(viewModel.windSpeed)"
            self.weatherDescription.text = viewModel.description
        }
        
    }
    
}
