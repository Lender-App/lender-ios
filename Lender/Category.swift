//
//  Category.swift
//  Lender
//
//  Created by Alex Chen on 11/9/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class Category: NSObject {
    var name: String
    var SNSTopicId: String?
    
    var dictionary: NSDictionary
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as! String
        SNSTopicId = dictionary["SNSTopicId"] as? String
    }
}
