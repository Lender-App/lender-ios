//
//  TransactionCell.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var transaction: Transaction! {
        didSet{
            titleLabel.text = transaction.borrowRequest.title
            usernameLabel.text = transaction.borrowRequest.user.name
            priceLabel.text = "$\(transaction.borrowRequest.price)"
            dateLabel.text = transaction.borrowRequest.dateNeededString
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
