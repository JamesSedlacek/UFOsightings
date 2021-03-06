//
//  UFOSightingsVM.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import UIKit

class UFOSightingsVM: NSObject {
    
    // MARK: Properties
    
    private var currentTab: TabOption = .strangeFlyers
    
    private var strangeFlyers: [UFOSighting] = []
    private var mysteriousLights: [UFOSighting] = []
    private var ufoSightings: [UFOSighting] = [] {
        didSet {
            guard let reloadTableViewClosure = reloadTableViewClosure else { return }
            
            strangeFlyers = ufoSightings.filter({ $0.type == .Lampshade || $0.type == .Blob })
            mysteriousLights = ufoSightings.filter({ $0.type == .MysteriousLights })
            
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
    
    public var reloadTableViewClosure: (()->())?
    
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
        return DateFormatting.shared.getDate(from: ufoSightings[row].time)
    }
    
    public func getTime(for row: Int) -> String {
        return DateFormatting.shared.getTime(from: ufoSightings[row].time)
    }
    
    public func getType(for row: Int) -> UFOSightingType {
        return currentTabSightings[row].type
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
                                      type: currentTab == .mysteriousLights ? .MysteriousLights : .Blob,
                                      time: Double.random(in: 1643921558..<500000000000))
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

// MARK: TableView DataSource

extension UFOSightingsVM: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTabSightings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibIdentifier = "UFOTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibIdentifier, for: indexPath) as? UFOTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: self, row: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
