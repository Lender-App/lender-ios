
//
//  TransactionCell.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import AFNetworking

class ListingCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var transaction: Transaction! {
        didSet {
            titleLabel.text = transaction.title
            usernameLabel.text = transaction.user.name
            priceLabel.text = "$\(transaction.price)"
            itemImageView.setImageWith(transaction.imageURL)
            dateLabel.text = transaction.dateAvailableString
            infoLabel.text = transaction.info ?? " "
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
