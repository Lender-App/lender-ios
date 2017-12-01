//
//  Transaction.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class Transaction: NSObject {
    var borrowRequest: Request
    var lender: User
    var category: Category?
    var date: Date
    var dateString: String {
        get {
            return Format.formatDate(date: date)
        }
    }
    var borrowRating: Decimal?
    var borrowReview: String?
    var lenderRating: Decimal?
    var lenderReview: String?
    
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        borrowRequest = dictionary["borrowRequest"] as! Request
        lender = dictionary["lender"] as! User
        date = dictionary["date"] as! Date
    }
}
