//
//  HeadingView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 4/10/24.
//

import SwiftUI

struct HeadingView: View {
    
    // MARK: - Properties
    
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundStyle(.accent)
                .imageScale(.large)
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(image: "photo.on.rectangle.angled", text: "Wilderness in Pictures")
}
