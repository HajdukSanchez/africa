//
//  ExternalLinkView.swift
//  Africa
//
//  Created by Jozek Hajduk on 7/10/24.
//

import SwiftUI

struct ExternalLinkView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Link(destination:
                        (URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)) {
                    Image(systemName: "arrow.up.right.square")
                    Text(animal.name)
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

#Preview {
    ExternalLinkView(animal: testAnimal)
}
