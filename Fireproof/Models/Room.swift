//
//  Room.swift
//  Fireproof
//
//  Created by Wenmin He on 1/13/18.
//  Copyright © 2018 CompanyName. All rights reserved.
//

import Foundation
class Room {
    var items =  [Item]()
    var roomName : String
    var numItems : Int
    var roomCost : Float
    
    init(roomName: String) {
        self.roomName = roomName
        numItems = 0
        roomCost = 0
    }
    
    func addItem(item: Item) {
        items.append(item)
        numItems += 1;
        roomCost += item.cost
    }
    
    
    
}
