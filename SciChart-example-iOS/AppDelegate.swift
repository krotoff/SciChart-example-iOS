//
//  AppDelegate.swift
//  SciChart-example-iOS
//
//  Created by Andrew Krotov on 26.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import UIKit
import SciChart

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let sciChartKey = getPlistValue(with: "SciChartLicenseKey") as? String {
            SCIChartSurface.setRuntimeLicenseKey(sciChartKey)
        }
        
        window = UIWindow()
        
        appCoordinator = AppCoordinator()
        appCoordinator!.start(in: window!)
        
        return true
    }
    
    // MARK: - Private methods
    
    private func getPlistValue(with key: String) -> Any? {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let file = FileManager.default.contents(atPath: path),
            let list = try? PropertyListSerialization.propertyList(from: file, options: .mutableContainersAndLeaves, format: nil),
            let dictionary = list as? [String: Any] else {
                return nil
        }
        
        return dictionary[key]
    }
}


