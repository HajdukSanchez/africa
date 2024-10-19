//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 19/10/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    AnimalGridItemView(animal: testAnimal)
}
