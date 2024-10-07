//
//  TestConstanst.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/10/24.
//

import Foundation

let _testAnimalData: [Animal] = Bundle.main.decode(JsonFilesNames.animals)
let testAnimal: Animal = _testAnimalData[0]

let _testVideoData: [Video] = Bundle.main.decode(JsonFilesNames.videos)
let testVideo: Video = _testVideoData[0]
