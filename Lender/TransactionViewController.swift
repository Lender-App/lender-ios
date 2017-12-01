
//
//  TransactionViewController.swift
//  Lender
//
//  Created by Alex Chen on 11/11/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var transaction: Transaction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = transaction.borrowRequest.title
        usernameLabel.text = transaction.borrowRequest.user.name
        priceLabel.text = "$\(transaction.borrowRequest.price)"
        dateLabel.text = transaction.dateString
        infoLabel.text = transaction.borrowRequest.info
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
