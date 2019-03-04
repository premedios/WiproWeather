//
//  WeatherPageDatasource.swift
//  WiproWeather
//
//  Created by Pedro Remedios on 01/03/2019.
//  Copyright © 2019 Pedro Remedios. All rights reserved.
//

import UIKit

class WeatherPageDataSource: NSObject, UIPageViewControllerDataSource {
    
    private var weatherViewControllers: [WeatherViewController]
    
    init(with pages:[WeatherViewController]) {
        weatherViewControllers = pages
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let previousIndex = weatherViewControllers.firstIndex(of: viewController as! WeatherViewController), previousIndex - 1 >= 0 {
            return weatherViewControllers[previousIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let nextIndex = weatherViewControllers.firstIndex(of: viewController as! WeatherViewController), nextIndex + 1 < weatherViewControllers.count {
            return weatherViewControllers[nextIndex + 1]
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return weatherViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentViewController = pageViewController.viewControllers?.first as? WeatherViewController else { return 0 }
        return weatherViewControllers.firstIndex(of: currentViewController)!
    }
}
