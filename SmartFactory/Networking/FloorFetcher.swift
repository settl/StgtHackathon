//
//  FloorFetcher.swift
//  SmartFactory
//
//  Created by Sophie on 28.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import Foundation


class FloorFetcher {
    let baseURL = "http://18.194.182.2/paletti/"

    func fetchFloorInfo() {
    }
    
    func fetchMachineInfo(completion: @escaping ([Machine]) -> Void) {
        let urlString = baseURL + "get_factory.php?token=1337&layer=machines"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let d = data, error == nil else {
                return
            }
            if let machines = FloorParser.parse(data: d) {
                completion(machines)
            }
        }.resume()
    }
    
    func fetchPathInfo(completion: @escaping ([PathComponent]) -> Void) {
        let urlString = baseURL + "get_waypoints.php?token=1337"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let d = data, error == nil else {
                return
            }
            if let path = FloorParser.parsePath(data: d) {
                completion(path)
            }
        }.resume()
    }
    
//    fileprivate func defaultURL() -> URL? {
//        let urlString = baseURL + "/rest/?method=flickr.photos.getPopular&api_key=\(apiKey)&per_page=18&format=json&nojsoncallback=1"
//        guard let url = URL(string:urlString) else {
//            return nil
//        }
//        return url
//    }
}
