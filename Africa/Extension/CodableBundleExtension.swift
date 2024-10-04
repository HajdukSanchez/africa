//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/10/24.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: JsonFilesNames) -> T {
        // 1. Locale json file
        guard let url = self.url(forResource: file.rawValue, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        // 2. Create a property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        // 3. Create a decoder
        let decoder = JSONDecoder()
        // 4. Create a property for decode the data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        // 5. Return the ready to use data
        return loaded
    }
}
