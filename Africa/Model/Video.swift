//
//  Video.swift
//  Africa
//
//  Created by Jozek Hajduk on 7/10/24.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
