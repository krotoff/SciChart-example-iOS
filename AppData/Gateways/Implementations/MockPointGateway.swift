//
//  MockPointGateway.swift
//  AppData
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import AppModel

internal final class MockPointGateway: PointProviderType {
    
    // MARK: - Private properties
    
    private var _timer: Timer?
    private var _lastPoint: Point?
    
    // MARK: - Internal methods
    
    internal func connect(receivingData completion: @escaping ((Point) -> Void)) {
        guard _timer == nil else {
            print("#ERR mock provider was already connected")
            return
        }
            
        _timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let `self` = self else { return }
            
            var rate: Double = 0
            if let last = self._lastPoint {
                let difference: Double = (Double(arc4random() % 2000) - 1000) / 1000
                rate = last.rate + difference
            }
            self._lastPoint = Point(date: Date(), rate: rate)
            completion(self._lastPoint!)
        }
        _timer?.fire()
    }
}
