//
//  GalleryView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Properties
    
    private let hapticFeedBack = UIImpactFeedbackGenerator(style: .medium)
    private let animals: [Animal] = Bundle.main.decode(JsonFilesNames.animals)
    //private let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns: Double = 3.0
    @State private var selectedAnimal: Animal?
    
    // MARK: - Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
    var body: some View {
        ZStack {
            MotionAnimationView()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 30) {
                    if let animal = self.selectedAnimal {
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                            }
                    }
                    Slider(value: $gridColumns, in: 2...4, step: 1)
                        .padding(.horizontal)
                        .onChange(of: gridColumns) { _, _ in
                            gridSwitch()
                        }
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                }
                                .onTapGesture {
                                    selectedAnimal = animal
                                    hapticFeedBack.impactOccurred()
                                }
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            selectedAnimal = animals.first
            gridSwitch()
        }
    }
}

#Preview {
    GalleryView()
}
