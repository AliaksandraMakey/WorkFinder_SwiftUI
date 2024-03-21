//
//  MapViews.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import SwiftUI
import MapKit

struct MiniMapView: View {
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Map(coordinateRegion: .constant(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 53.9045, longitude: 27.5615),
                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    )
                ))
                .frame(width: geometry.size.width, height: 58)
                .cornerRadius(8)
            }
        }
    }
}


struct ExpandedMapView: View {
    //MARK: - Properties
    @State private var isMiniMapVisible = false
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Map(coordinateRegion: .constant(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                    )
                ))
                .frame(width: geometry.size.width, height: geometry.size.height / 1.2)
                .background(Color.black.edgesIgnoringSafeArea(.all))
            }
        }
    }
}

