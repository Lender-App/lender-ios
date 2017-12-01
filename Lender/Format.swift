//
//  Format.swift
//  Lender
//
//  Created by Alex Chen on 11/28/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import Foundation

class Format {
    class func formatPrice(amount: Int) -> String! {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: amount as NSNumber)
    }
    
    class func formatDate(date: Date) -> String {
        let calendar = Calendar.current
        let TSYear = calendar.component(.year, from: date)
        let TSMonth = calendar.component(.month, from: date)
        let TSDay = calendar.component(.day, from: date)
        let TSHour = calendar.component(.hour, from: date)
        let TSMinute = calendar.component(.minute, from: date)
        
        let date = Date()
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        if TSYear != year {
            return "\(TSMonth)/\(TSDay)/\(TSYear)"
        } else {
            if TSMonth != month {
                return "\(TSMonth)/\(TSDay)/\(TSYear)"
            } else {
                if TSDay != day {
                    if day - TSDay < 7 {
                        return "\(day - TSDay)d"
                    } else {
                        return "\(TSMonth)/\(TSDay)/\(TSYear)"
                    }
                } else {
                    if TSHour != hour {
                        return "\(hour - TSHour)h"
                    } else {
                        if minute - TSMinute == 0 {
                            return "Now"
                        }
                        return "\(minute - TSMinute)m"
                    }
                }
            }
        }
    }
}
