//
//  BlePeripheralTableViewCell.swift
//  BlueLightTest
//
//  Created by imac-3282 on 2023/7/31.
//

import UIKit

class BlePeripheralTableViewCell: UITableViewCell {
    
    @IBOutlet weak var peripheralNameLabel: UILabel!
    
    static let identifier = "BlePeripheralTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
