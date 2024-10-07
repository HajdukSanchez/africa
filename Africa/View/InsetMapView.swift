//
//  InsetMapView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 4/10/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    // MARK: - Properties
    
    // Span is the zoom, and the center is the location
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
        center: CLLocationCoordinate2DMake(6.600286, 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)))
    
    var body: some View {
        Map(position: $cameraPosition)
            .overlay(alignment: .topTrailing, content: {
                NavigationLink {
                    MapView()
                } label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    )
                }
                .padding(12)
            })
            .frame(height: 256)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    InsetMapView()
}
