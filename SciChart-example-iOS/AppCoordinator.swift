//
//  AppCoordinator.swift
//  SciChart-example-iOS
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import UIKit
import AppServices
import AppData

internal final class AppCoordinator {
    
    // MARK: - Private properties

    private let dataFactory = AppDataFactory()
    private lazy var servicesFactory = AppServicesFactory(provider: dataFactory.makePointProvider())

    // MARK: - Internal methods
    
    internal func start(in window: UIWindow) {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.barTintColor = .darkGray
        
        let chartCoordinator = ChartCoordinator()
        chartCoordinator.start(in: navigationController, with: servicesFactory.makePointsService())
        
        window.rootViewController = navigationController
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }
}
