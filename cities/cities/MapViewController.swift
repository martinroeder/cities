//
//  MapViewController.swift
//  cities
//
//  Created by Martin Roeder on 1/17/19.
//  Copyright © 2019 Martin Roeder. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var city: City?
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let city = city {
            cityLabel.text = "\(city.name), \(city.country)"

            let distance: CLLocationDistance = 100000 // distance in meters
            let location = CLLocationCoordinate2D(latitude: city.lat, longitude: city.lon)
            let region = MKCoordinateRegion(center: location, latitudinalMeters: distance, longitudinalMeters: distance)
            mapView.setRegion(region, animated: true)
        }

    }
}
