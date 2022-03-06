//
//  UFOTableViewCell.swift
//  UFOsightings
//
//  Created by James Sedlacek on 3/5/22.
//

import UIKit

class UFOTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var ufoTypeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ufoImageView: UIImageView!
    
    func configureCell(with vm: UFOSightingsVM, row: Int) {
        self.dateLabel.text = vm.getDate(for: row)
        self.timeLabel.text = vm.getTime(for: row)
        self.speedLabel.text = vm.getSpeed(for: row)
        self.ufoTypeLabel.text = vm.getType(for: row).title
        self.ufoImageView.image = vm.getImage(for: row)
    }
}
