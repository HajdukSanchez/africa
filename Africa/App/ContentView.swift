//
//  ContentView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
