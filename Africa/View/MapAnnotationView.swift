//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 14/10/24.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // MARK: - Properties
    
    var location: ComplexLocation
    @State private var isAnimating: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54, alignment: .center)
            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(isAnimating))
                .opacity(1 - isAnimating)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                isAnimating = 1.0
            }
        }
    }
}

#Preview {
    MapAnnotationView(location: testLocation)
}
