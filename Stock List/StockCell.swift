//
//  StockCell.swift
//  Stock List
//
//  Created by Luis Madriz on 4/25/22.
//

import UIKit

class StockCell: UITableViewCell {
    
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*func setUp(symbol: String, name: String) {
        symbolLabel.text = symbol
        nameLabel.text = name
    }*/

}
