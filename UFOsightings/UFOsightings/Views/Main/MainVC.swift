//
//  MainVC.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import UIKit

// MARK: TabOption

enum TabOption: Int {
    case strangeFlyers = 0, mysteriousLights
}

// MARK: MainVC

class MainVC: UIViewController {

    // MARK: Properties
    
    fileprivate var currentTab: TabOption = .strangeFlyers
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Actions
    
    @IBAction func plusTapped(_ sender: UIBarButtonItem) {
        // TODO: Add an entry with random attributes
        // corresponding to the tab the user is on
    }
    
    @IBAction func tabChanged(_ sender: UISegmentedControl) {
        if let selectedTab = TabOption(rawValue: sender.selectedSegmentIndex) {
            currentTab = selectedTab
            tableView.reloadData()
        }
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: TableView

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
