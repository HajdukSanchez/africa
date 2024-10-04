//
//  ContentView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode(JsonFilesNames.animals)
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets())
                ForEach(animals) { animal in
                    AnimalListItemView(animal: animal)
                }
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
