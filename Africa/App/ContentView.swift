//
//  ContentView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    private var gridColumn1ToolbarIcon: String = "rectangle.grid.1x2"
    private var gridColumn2ToolbarIcon: String = "square.grid.2x2"
    private var gridColumn3ToolbarIcon: String = "square.grid.3x2"
    private let animals: [Animal] = Bundle.main.decode(JsonFilesNames.animals)
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var isGridViewActive: Bool = false
    @State private var gridColums: Int = 1
    @State private var gridToolBarIcon: String = "square.grid.2x2"
    
    // MARK: - Functions
    
    func gridSwtich() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColums = gridLayout.count
        }
        
        switch gridColums {
        case 1:
            gridToolBarIcon = gridColumn2ToolbarIcon
        case 2:
            gridToolBarIcon = gridColumn3ToolbarIcon
        case 3:
            gridToolBarIcon = gridColumn1ToolbarIcon
        default:
            gridToolBarIcon = gridColumn2ToolbarIcon
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets())
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accent)
                        }
                        Button {
                            if isGridViewActive {
                                gridSwtich()
                            } else {
                                isGridViewActive = true
                            }
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: gridToolBarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
