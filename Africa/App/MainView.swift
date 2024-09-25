//
//  MainView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Broswer", systemImage: "square.grid.2x2") {
                ContentView()
            }
            Tab("Watch", systemImage: "play.rectangle") {
                VideoListView()
            }
            Tab("Locations", systemImage: "map") {
                MapView()
            }
            Tab("Gallery", systemImage: "photo") {
                GalleryView()
            }
        }
    }
}

#Preview {
    MainView()
}
