//
//  ChartCoordinator.swift
//  SciChart-example-iOS
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import UIKit
import AppServices

internal final class ChartCoordinator {
    
    // MARK: - Private properties
    
    private var _controller: UIViewController?
    
    // MARK: - Internal methods
    
    internal func start(in navigationController: UINavigationController, with pointService: PointsServiceType) {
        let controller = ChartViewController()
        controller.configure(with: pointService)
        _controller = controller
        navigationController.pushViewController(_controller!, animated: false)
    }
}
