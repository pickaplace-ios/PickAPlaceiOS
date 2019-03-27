//
//  Business.swift
//  PickAPlaceiOS
//
//  Created by Keith Tan on 3/27/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import Foundation

struct Business: Codable {
    let name: String
    let rating: String
    let image_url: String
    let phone: String
    let price: String?
    let url: String
    let location: Location
}

// May need to refactor this into a seperate file
struct Location: Codable {
    let city: String
    let country: String
    let address1: String
    let address2: String?
    let address3: String?
    let state: String
    let zip_code: String
}

struct BusinessWrapper: Codable {
    let businesses: [Business]
}
