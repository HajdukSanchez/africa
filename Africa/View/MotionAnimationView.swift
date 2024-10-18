//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 18/10/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    
    @State private var randomCircles: Int = Int.random(in: 16...25)
    @State private var isAnimating: Bool = false
    
    // MARK: - Functions
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let circleSize = randomSize()
                
                ForEach(0...randomCircles, id: \.self)  { _ in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: circleSize, height: circleSize, alignment: .center)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .onAppear {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            ) {
                                isAnimating = true
                            }
                        }
                }
            }
            .drawingGroup()
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    MotionAnimationView()
}
