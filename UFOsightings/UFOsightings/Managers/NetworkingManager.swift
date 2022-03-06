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
                                                type: .Blob,
                                                time: 1483821300),
                                    UFOSighting(id: "1",
                                                speed: 3,
                                                type: .Lampshade,
                                                time: 1721721300),
                                    UFOSighting(id: "2",
                                                speed: 21,
                                                type: .MysteriousLights,
                                                time: 1221331300),
                                    UFOSighting(id: "3",
                                                speed: 17,
                                                type: .MysteriousLights,
                                                time: 1486655300)]
    
    static func fetchUFOSightings(completion: @escaping (Result<[UFOSighting], Error>) -> Void) {
        completion(.success(NetworkingManager.dummyData))
    }
}
