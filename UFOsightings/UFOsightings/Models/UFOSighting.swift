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
    let type: String // (blob, lampshade, mysteriousLights)
    let time: Int // timeIntervalSince1970
}
