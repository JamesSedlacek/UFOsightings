//
//  UFOSightingsVM.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import UIKit

class UFOSightingsVM {
    
    // MARK: Properties
    
    private var currentTab: TabOption = .strangeFlyers
    
    private var strangeFlyers: [UFOSighting] = []
    private var mysteriousLights: [UFOSighting] = []
    private var ufoSightings: [UFOSighting] = [] {
        didSet {
            guard let reloadTableViewClosure = reloadTableViewClosure else { return }
            
            strangeFlyers = ufoSightings.filter({ $0.type == UFOSightingType.Lampshade.title ||
                $0.type == UFOSightingType.Blob.title })
            
            mysteriousLights = ufoSightings.filter({ $0.type == UFOSightingType.MysteriousLights.title })
            
            reloadTableViewClosure()
        }
    }
    
    private var currentTabSightings: [UFOSighting] {
        switch currentTab {
        case .strangeFlyers:
            return strangeFlyers
        case .mysteriousLights:
            return mysteriousLights
        }
    }
    
    public var numberOfRows: Int {
        return currentTabSightings.count
    }
    
    public var reloadTableViewClosure: (()->())?
    
    // MARK: Initializers
    
    init() {
        
    }
    
    // MARK: Update Tab
    
    public func updateTab(to option: TabOption) {
        currentTab = option
        if let reloadTableViewClosure = reloadTableViewClosure {
            reloadTableViewClosure()
        }
    }
    
    // MARK: Fetch
    
    public func fetchSightings() {
        NetworkingManager.fetchUFOSightings(completion: { [unowned self] result in
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
        return "January 25, 2020" // TODO: format the date for ufoSightings[row].date
    }
    
    public func getTime(for row: Int) -> String {
        return "7:30AM" // TODO: format the time for ufoSightings[row].time
    }
    
    public func getType(for row: Int) -> UFOSightingType {
        let typeText = currentTabSightings[row].type
        for sighting in UFOSightingType.allCases {
            if sighting.title == typeText {
                return sighting
            }
        }
        return .MysteriousLights // Default case
    }
    
    public func getSpeed(for row: Int) -> String {
        return "\(currentTabSightings[row].speed) knots"
    }
    
    public func getImage(for row: Int) -> UIImage {
        let defaultImage = UIImage()
        let imageName = getType(for: row).imageName
        return UIImage(systemName: imageName) ?? defaultImage
    }
    
    // MARK: Append
    
    public func appendRandom() {
        let newSighting = UFOSighting(id: UUID().uuidString,
                                      speed: Double(Int.random(in: 5..<30)),
                                      type: currentTab == .mysteriousLights ? "mysteriousLights" : "blob",
                                      time: 1481721300)
        ufoSightings.append(newSighting)
    }
    
    // MARK: Delete
    
    public func delete(at row: Int) {
        let id = currentTabSightings[row].id
        if let index = ufoSightings.firstIndex(where: { $0.id == id }) {
            ufoSightings.remove(at: index)
        }
    }
}
