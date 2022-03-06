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
        tableView.delegate = self
        tableView.dataSource = self
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

// MARK: TableView

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ufoVM.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibIdentifier, for: indexPath) as? UFOTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: ufoVM, row: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.5
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ufoVM.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
