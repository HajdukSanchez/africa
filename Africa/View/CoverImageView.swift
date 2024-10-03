//
//  CoverImageView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 3/10/24.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
}
