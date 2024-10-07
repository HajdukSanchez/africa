//
//  InsetFactyView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 4/10/24.
//

import SwiftUI

struct InsetFactyView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

#Preview {
    InsetFactyView(animal: testAnimal)
}
