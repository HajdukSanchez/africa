//
//  VideoPlayerUtility.swift
//  Africa
//
//  Created by Jozek Hajduk on 7/10/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName name: String, fileFormat format: String) -> AVPlayer {
    if let video = Bundle.main.url(forResource: name, withExtension: format) {
        videoPlayer = AVPlayer(url: video)
        videoPlayer?.play() // Automatic run video
    }
    return videoPlayer!
}
