//
//  City.swift
//  cities
//
//  Created by Martin Roeder on 1/16/19.
//  Copyright © 2019 Martin Roeder. All rights reserved.
//

import Foundation

class City {
    let country, name: String
    let id: Int
    let lon, lat: Double

    init(country: String, name: String, id: Int, lon: Double, lat: Double) {
        self.country = country
        self.name = name
        self.id = id
        self.lon = lon
        self.lat = lat
    }
}
