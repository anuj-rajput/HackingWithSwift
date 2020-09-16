//
//  Capital.swift
//  CapitalCities
//
//  Created by Anuj Rajput on 16/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var url: URL {
        let city = title?.replacingOccurrences(of: " ", with: "_")
        let urlString = "https://en.wikipedia.org/wiki/\(city ?? "")"
        return URL(string: urlString)!
    }

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
