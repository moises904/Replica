//
//  DataInitialModel.swift
//  ReplicaBCP
//
//  Created by Moises Almeyda on 23/04/21.
//

import Foundation

struct DataConfigurationModel: DataInitial {
    public var timeSplash: Int
    var typeGreats: String
    var enableSound: Bool

    init() {
        timeSplash = 0
        typeGreats = ""
        enableSound = false
    }
}

protocol DataInitial {
    var timeSplash: Int { get set}
    var typeGreats: String { get set}
    var enableSound: Bool { get set }
    
}
