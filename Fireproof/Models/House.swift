//
//  House.swift
//  Fireproof
//
//  Created by Wenmin He on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import Foundation
class House {
    var totalCost: Float
    var RoomObjs = [Room]()
    
    init() {
        totalCost = 0;
    }
    
    func addRoom(obj: Room) {
        RoomObjs.append(obj);
        totalCost += obj.roomCost
    }
}
