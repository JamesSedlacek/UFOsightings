//
//  UFOSightingsVM.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import UIKit

class UFOSightingsVM {
    
    // MARK: Properties
    private var ufoSightings: [UFOSighting] = []
    
    public lazy var numberOfRows = {
        return self.ufoSightings.count
    }
    
    // MARK: Initializers
    
    init() {
        NetworkingManager.fetchUFOSightings(completion: { result in
            switch result {
            case .success(let sightings):
                self.ufoSightings = sightings
            case .failure(_):
                fatalError("Networking Error")
            }
        })
    }
    
    // MARK: Getters
    
    public func getDate(for row: Int) -> String {
        return "" // TODO: format the date for ufoSightings[row].date
    }
    
    public func getTime(for row: Int) -> String {
        return "" // TODO: format the time for ufoSightings[row].time
    }
    
    public func getType(for row: Int) -> UFOSightingType {
        return UFOSightingType(rawValue: ufoSightings[row].type) ?? .blob
    }
    
    public func getSpeed(for row: Int) -> String {
        return "\(ufoSightings[row].speed) knots"
    }
    
    public func getImage(for row: Int) -> UIImage {
        let defaultImage = UIImage()
        var image = defaultImage
        
        switch getType(for: row) {
        case .blob:
            image = UIImage(systemName: "circle.fill") ?? defaultImage
        case .lampshade:
            image = UIImage(systemName: "square.fill") ?? defaultImage
        case .mysteriousLights:
            image = UIImage(systemName: "diamond.fill") ?? defaultImage
        }
        
        return image
    }
}
