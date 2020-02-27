//
//  AppDataFactory.swift
//  AppData
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

public final class AppDataFactory {
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - Public methods
    
    public func makePointProvider() -> PointProviderType {
        return MockPointGateway()
    }
}
