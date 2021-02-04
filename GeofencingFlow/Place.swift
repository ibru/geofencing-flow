//
//  Place.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import Foundation
import CoreLocation

struct Place: Identifiable, Equatable {
    let id: String
    let name: String
    let location: Location
}

extension Place {
    struct Location: Equatable {
        let latitude: Double
        let longitude: Double
    }
}

extension Place {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}
