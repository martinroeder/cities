//
//  Data.swift
//  cities
//
//  Created by Martin Roeder on 1/16/19.
//  Copyright © 2019 Martin Roeder. All rights reserved.
//
//  Data is provided in a sorted array. The array will make it easy to display
//  this information in a tableview. 

import Foundation
import UIKit

class CityData : NSObject {
    
    let listOfCities: [City]
    private var _listOfCities: [City] = []
    
    override init() {
        
        //  URL of zipped JSON object
//        if let url = URL(string: "https://s3-eu-west-1.amazonaws.com/uploads-eu.hipchat.com/128845/1765144/LqgK6ORrJR4VZ1G/cities.json.zip")
        
        // Local URL of unzipped JSON object
        if let localUrl = Bundle.main.url(forResource: "cities", withExtension: "json") {
            // Parse JSON
            do {
                let urlContents = try Data(contentsOf: localUrl, options: .mappedIfSafe)
                if let jsonData = try JSONSerialization.jsonObject(with: urlContents, options: .allowFragments) as? Array<NSDictionary> {
                    print("Info: read \(jsonData.count) objects")
                    for datum in jsonData {
                        guard let country = datum["country"] as? String else {
                            print("Error parsing country")
                            continue
                        }
                        guard let name = datum["name"] as? String else {
                            print("Error parsing name")
                            continue
                        }
                        guard let id = datum["_id"] as? Int else {
                            print("Error parsing id")
                            continue
                        }
                        guard let coord = datum["coord"] as? NSDictionary else {
                            print("Error parsing coord")
                            continue
                        }
                        guard let lon = coord["lon"] as? Double else {
                            print("Error parsing lon")
                            continue
                        }
                        guard let lat = coord["lat"] as? Double else {
                            print("Error parsing lat")
                            continue
                        }
                        
                        _listOfCities.append(City(country: country, name: name, id: id, lon: lon, lat: lat))
                    }
                }
            } catch {
                print("Error: parsing json")
            }
        } else {
            print("Error: invalid url")
        }
        
        // Sort data
        listOfCities = _listOfCities.sorted(by: {
            if $0.name != $1.name {
                return $0.name < $1.name
            } else {
                return $0.country < $1.country
            }
        })
        
        super.init()
    }
}
