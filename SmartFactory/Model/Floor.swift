//
//  Floor.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation

class Floor {
    static let floorWidth = 16
    static let floorHeight = 12
    
    var tiles = Array<Tile>()
    
    init() {
        let totalNumberOfTiles = Floor.floorWidth * Floor.floorHeight
        for index in 0..<totalNumberOfTiles {
            tiles.append(Tile(index: index))
        }
    }
}
