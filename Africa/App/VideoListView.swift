//
//  VideoListView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    
    // List must be a @State to allow the perform of the Shuffle action
    @State var videos: [Video] = Bundle.main.decode(JsonFilesNames.videos)
    @State var selectedVideo: Video?
    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List {
                ForEach(videos) { video in
                    NavigationLink {
                        VideoPlayerView(videoSelected: video.id, videoTitle: video.name)
                    } label: {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                            .onTapGesture {
                                selectedVideo = video
                            }
                    }

                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred() // Add a haptic interaction
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } detail: {
            if let video = selectedVideo {
                VideoPlayerView(videoSelected: video.id, videoTitle: video.name)
            } else {
                Text("No video selected")
                    .font(.title2)
            }
        }
        .onAppear {
            selectedVideo = videos.first
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    VideoListView()
}
