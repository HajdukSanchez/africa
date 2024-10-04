//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 4/10/24.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: Properties
    
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
}

#Preview {
    InsetGalleryView(animal: testAnimal)
}
