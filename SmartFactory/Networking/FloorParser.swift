//
//  FloorParser.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation

struct FloorParser  {
    static func parse(data: Data) -> [Machine]? {
        let decoder = JSONDecoder()
        do {
            let machines = try decoder.decode([Machine].self, from: data)
            return machines
        } catch {
            print("error trying to convert data to JSON")
            print(error)
            return nil
        }
    }
    
    static func parsePath(data: Data) -> [PathComponent]? {
        let decoder = JSONDecoder()
        do {
            let path = try decoder.decode([PathComponent].self, from: data)
            return path
        } catch {
            print("error trying to convert data to JSON")
            print(error)
            return nil
        }
    }
}
