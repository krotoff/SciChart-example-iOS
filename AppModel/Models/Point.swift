//
//  Point.swift
//  AppModel
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import Foundation

public struct Point {
    
    // MARK: - Public properties
    
    public let date: NSDate
    public let rate: Double
    
    // MARK: - Initialization
    
    public init(date: Date, rate: Double) {
        self.date = date as NSDate
        self.rate = rate
    }
}
