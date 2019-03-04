//
//  AppDelegate.swift
//  WiproWeather
//
//  Created by Pedro Remedios on 27/02/2019.
//  Copyright © 2019 Pedro Remedios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.backgroundColor = UIColor(red: 0, green: 150/255, blue: 255/255, alpha: 1)
        return true
    }
}

