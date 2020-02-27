//
//  PointProviderType.swift
//  AppData
//
//  Created by Andrew Krotov on 27.02.2020.
//  Copyright © 2020 Andrew Krotov. All rights reserved.
//

import AppModel

public protocol PointProviderType {
    func connect(receivingData completion: @escaping ((Point) -> Void))
}
