//
//  ComplexLocation.swift
//  Africa
//
//  Created by Jozek Hajduk on 7/10/24.
//

import Foundation
import MapKit

struct ComplexLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed property
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
