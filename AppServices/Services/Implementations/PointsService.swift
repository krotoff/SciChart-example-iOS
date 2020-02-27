//
//  PointsService.swift
//  AppServices
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import AppData
import AppModel

internal final class PointsService: PointsServiceType {
    
    // MARK: - Private properties
    
    private var _points = [Point]()
    private let _pointProvider: PointProviderType
    private let isolationQueue = DispatchQueue(label: "com.krotov.scichart.services.points", attributes: .concurrent)
    
    // MARK: - Initialization
    
    internal init(provider: PointProviderType) {
        _pointProvider = provider
    }
    
    // MARK: - Internal methods
    
    internal func subscribeOn(updatingData completion: @escaping (([Point]) -> Void)) {
        _pointProvider.connect { [weak self] point in
            guard let `self` = self else { return }
            
            self.isolationQueue.async(flags: .barrier) {
                self._points.append(point)
                completion(self._points)
            }
        }
    }
}
