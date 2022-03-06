//
//  UFOSighting.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import Foundation

struct UFOSighting: Codable {
    let id: String // Unique identifier 
    let speed: Double // Measured in Knots
    let type: UFOSightingType // (blob, lampshade, mysteriousLights)
    let time: Double // timeIntervalSince1970
}

enum UFOSightingType: Int, CaseIterable, Codable {
    case Blob = 0
    case Lampshade = 1
    case MysteriousLights = 2
    
    var title: String {
        switch self {
        case .Blob: return "blob"
        case .Lampshade: return "lampshade"
        case .MysteriousLights: return "mysteriousLights"
        }
    }
    
    var imageName: String {
        switch self {
        case .Blob: return "circle.fill"
        case .Lampshade: return "square.fill"
        case .MysteriousLights: return "diamond.fill"
        }
    }
}
