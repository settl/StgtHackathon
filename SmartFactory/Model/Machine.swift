//
//  Machine.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation
import UIKit

struct Machine: Decodable {
    let id: String
    let name: String
    let typ: String
    let position_x: String
    let position_y: String
    let size_x: String
    let size_y: String
    
    func imageForType() -> UIImage {
        if typ == "1" { return #imageLiteral(resourceName: "bohrmaschine_unselected") }
        if typ == "3" { return #imageLiteral(resourceName: "lackieren_unselected") }
        if typ == "4" { return #imageLiteral(resourceName: "fraesen_unselected") }
        if typ == "5" { return #imageLiteral(resourceName: "saegen_unselected") }
        if typ == "6" { return #imageLiteral(resourceName: "fraesen_unselected") }
        return #imageLiteral(resourceName: "unselected")
    }
}



//private enum CodingKeys: String, CodingKey {
//    case id, name, type
//    case positionX = "position_x"
//    case positionY = "position_y"
//    case sizeX = "size_x"
//    case sizeY = "size_y"
//}

//{"id":"1","name":"bohr_maschienen_park","typ":"1","maschienenzeit":"0","position_x":"5","position_y":"1","fk_factory_item":"1","rotation":"0","image_url":"\/images\/bmp.png","size_x":"1","size_y":"2"},

