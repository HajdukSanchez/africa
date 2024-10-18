//
//  MapView.swift
//  Africa
//
//  Created by Jozek Andrzej Hajduk Sanchez on 24/09/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Properties
    
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
            span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        )
    )
    let complexes: [ComplexLocation] = Bundle.main.decode(JsonFilesNames.locations)
    
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(complexes) { complex in
                Annotation(complex.name, coordinate: complex.locationCoordinate) {
                    MapAnnotationView(location: complex)
                }
            }
        }
        .overlay(alignment: .top) {
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(String(describing: cameraPosition.region?.center.latitude))")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(String(describing: cameraPosition.region?.center.longitude))")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(0.6)
            )
            .padding()
        }
    }
}

#Preview {
    MapView()
}
