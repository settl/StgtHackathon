//
//  Tile.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation

struct Tile: Codable {
    enum Status: String, Codable {
        case empty = "empty"
        case path = "path"
        case item = "item"
        case machineTop = "machineTop"
        case machineBottom = "machineBottom"
    }
    
    var status: Status = .empty
    var isMine: Bool = false
    var adjacent: Int8 = 0
    var index: Int
    
    init(index: Int) {
        self.index = index
    }
}
