//
//  Inceptionv3+Fritz.swift
//  Fireproof
//
//  Created by Eric Hsiao on 2/6/18.
//  Copyright © 2018 Fireproof. All rights reserved.
//

import Fritz

extension Inceptionv3: SwiftIdentifiedModel {

    static let modelIdentifier = "<insert model id>"

    static let packagedModelVersion = 1

    static let session = Session(appToken: "<insert app token>")
}
