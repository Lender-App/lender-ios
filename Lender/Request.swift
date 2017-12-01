//
//  Request.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class Request: NSObject {
    var title: String
    var user: User
    var category: Category?
    var price: Int
    var dateNeeded: Date?
    var dateNeededString: String {
        get{
            return dateNeeded != nil ? Format.formatDate(date: dateNeeded!) : ""
        }
    }
    var info: String?
    
    var dictionary: NSDictionary
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        title = dictionary["title"] as! String
        user = dictionary["user"] as! User
        price = dictionary["price"] as! Int
        dateNeeded = dictionary["dateNeeded"] as? Date
        info = dictionary["info"] as? String
    }
}
