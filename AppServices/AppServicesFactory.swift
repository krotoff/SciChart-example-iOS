//
//  AppServicesFactory.swift
//  AppServices
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import AppData

public final class AppServicesFactory {
    
    // MARK: - Private properties
    
    private let _provider: PointProviderType
    
    // MARK: - Initialization
    
    public init(provider: PointProviderType) {
        _provider = provider
    }
    
    // MARK: - Public methods
    
    public func makePointsService() -> PointsServiceType {
        return PointsService(provider: _provider)
    }
}
