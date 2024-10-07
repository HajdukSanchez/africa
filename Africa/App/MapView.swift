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
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
}

#Preview {
    MapView()
}
