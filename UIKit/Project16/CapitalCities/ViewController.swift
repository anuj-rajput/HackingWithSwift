//
//  ViewController.swift
//  CapitalCities
//
//  Created by Anuj Rajput on 16/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newDelhi = Capital(title: "New Delhi", coordinate: CLLocationCoordinate2D(latitude: 28.626963, longitude: 77.215396), info: "Home to the 2010 CWG")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a 1000 years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        
        mapView.addAnnotations([newDelhi, oslo, paris, rome, washington])
    }
}
