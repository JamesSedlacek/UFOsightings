//
//  NetworkingManager.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import Foundation

struct NetworkingManager {
    
    private static let dummyData = [UFOSighting(id: "0",
                                                speed: 14,
                                                type: "blob",
                                                time: 1481721300),
                                    UFOSighting(id: "1",
                                                speed: 3,
                                                type: "lampshade",
                                                time: 1481721300),
                                    UFOSighting(id: "2",
                                                speed: 21,
                                                type: "mysteriousLights",
                                                time: 1481721300),
                                    UFOSighting(id: "3",
                                                speed: 17,
                                                type: "mysteriousLights",
                                                time: 1481721300)]
    
    static func fetchUFOSightings(completion: @escaping (Result<[UFOSighting], Error>) -> Void) {
        completion(.success(NetworkingManager.dummyData))
    }
}
