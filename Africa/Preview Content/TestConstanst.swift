//
//  TestConstanst.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/10/24.
//

import Foundation

private let _testAnimalData: [Animal] = Bundle.main.decode(JsonFilesNames.animals)
let testAnimal: Animal = _testAnimalData[0]

private let _testVideoData: [Video] = Bundle.main.decode(JsonFilesNames.videos)
let testVideo: Video = _testVideoData[0]

private let _testLocationsData: [ComplexLocation] = Bundle.main.decode(JsonFilesNames.locations)
let testLocation: ComplexLocation = _testLocationsData[0]
