//
//  Path.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation
import UIKit

struct PathComponent: Decodable {
    let state: String
    let position_x: String
    let position_y: String
    let rotation: String
    
    func imageForState() -> UIImage {
        var degrees: CGFloat = 0.0
        if rotation == "1" {
            degrees = 90.0
        } else if rotation == "2" {
            degrees = 180.0
        } else if rotation == "3" {
            degrees = 270.0
        }
        
        if state == "0" { return #imageLiteral(resourceName: "route").rotatedByDegrees(degrees: degrees) }
        if state == "1" { return #imageLiteral(resourceName: "route_selected").rotatedByDegrees(degrees: degrees)}
        return #imageLiteral(resourceName: "unselected")
    }
}
