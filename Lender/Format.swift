//
//  File.swift
//  Lender
//
//  Created by Alex Chen on 11/28/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import Foundation

class Format {
    class func formatCurrency(amount: Decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formattedCurrencyString = formatter.string(from: amount as NSNumber)
}
