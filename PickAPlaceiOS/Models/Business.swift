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
    let price: String
    let url: String

}

struct BusinessWrapper: Codable {
    let results: [Business]
}
