//
//  Item.swift
//  Fireproof
//
//  Created by Wenmin He on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import Foundation
import UIKit
class Item {
    var title: String?
    var img: UIImage?
    var cost: Float
    var additionalDetails: String?
    var quantity: Int?
    var referenceLink: String?
    var included: Bool
    
    init(title: String?, img: UIImage?, cost: Float, additionalDetails: String?, quantity: Int?, referenceLink: String?, included: Bool) {
        self.title = title
        self.img = img
        self.cost = cost
        self.additionalDetails = additionalDetails
        self.quantity = quantity
        self.referenceLink = referenceLink
        self.included = included
    }
}
