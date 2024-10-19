//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Jozek Hajduk on 7/10/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - Properties
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
                .overlay(alignment: .topTrailing, content: {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                })
                .navigationTitle(videoTitle)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
