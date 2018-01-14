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
    var img: UIImage?
    var cost: Float
    var additionalDetails: String?
    var quantity: Int?
    var referenceLink: String?
    
    init(img: UIImage?, cost: Float, additionalDetails: String?, quantity: Int?, referenceLink: String?) {
        self.img = img
        self.cost = cost
        self.additionalDetails = additionalDetails
        self.quantity = quantity
        self.referenceLink = referenceLink
    }
    
}
