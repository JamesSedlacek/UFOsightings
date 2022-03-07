//
//  MainVC.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import UIKit

// MARK: TabOption

enum TabOption: Int {
    case strangeFlyers = 0
    case mysteriousLights = 1
}

// MARK: MainVC

class MainVC: UIViewController {

    // MARK: Properties
    
    private var ufoVM = UFOSightingsVM()
    private let nibIdentifier = "UFOTableViewCell"
    
    // MARK: Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: Actions
    
    @IBAction func plusTapped(_ sender: UIBarButtonItem) {
        ufoVM.appendRandom()
    }
    
    @IBAction func tabChanged(_ sender: UISegmentedControl) {
        if let selectedTab = TabOption(rawValue: sender.selectedSegmentIndex) {
            ufoVM.updateTab(to: selectedTab)
        }
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupVM()
    }
    
    // MARK: Setup
    
    private func setupTableView() {
        tableView.dataSource = ufoVM
        tableView.register(UINib(nibName: nibIdentifier, bundle: nil),
                           forCellReuseIdentifier: nibIdentifier)
    }
    
    private func setupVM() {
        ufoVM.reloadTableViewClosure = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        ufoVM.fetchSightings()
    }
}
