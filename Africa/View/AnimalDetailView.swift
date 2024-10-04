//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 4/10/24.
//

import SwiftUI

struct AnimalDetailView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accentColor.frame(height: 6).offset(y: 26)
                    )
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)
                Group {
                    HeadingView(image: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AnimalDetailView(animal: testAnimal)
}
