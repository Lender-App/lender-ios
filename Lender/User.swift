//
//  User.swift
//  Lender
//
//  Created by Alex Chen on 4/3/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit
import CoreLocation

class User: NSObject {
    var name: String
    var email: String?
    var phone: Int?
    var imageURL: URL?
    var location: CLLocationCoordinate2D?
    var interests: [Category]?

    var borrowRating: Decimal?
    var lendRating: Decimal?
    var requests: [Request]?
    var transactions: [Transaction]?
    
    var dictionary: NSDictionary
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as! String
        email = dictionary["email"] as? String
        phone = dictionary["phone"] as? Int
        imageURL = dictionary["image_url"] as? URL
        location = dictionary["location"] as? CLLocationCoordinate2D
        borrowRating = 0
        lendRating = 0
        requests = dictionary["requests"] as? [Request]
        transactions = dictionary["transactions"] as? [Transaction]
    }
    
    static var _currentUser: User?
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                let data = defaults.object(forKey: "currentUserData") as? Data
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: [])
                    _currentUser = User(dictionary: dictionary as! NSDictionary)
                } else {
                    print("Current user data not found!")
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }
}
