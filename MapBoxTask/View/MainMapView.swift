//
//  MainMapView.swift
//  MapBoxTask
//
//  Created by Amneh Shalabyeh on 5/18/25.
//

import SwiftUI
import MapboxMaps

struct MainMapView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(viewport: $viewModel.initialViewport) {
                if let mapPin = viewModel.mapPin {
                    mapPin
                }
            }
            .mapStyle(.standard(lightPreset: colorScheme == .light ? .day : .night))
            .onMapTapGesture { context in
                viewModel.mapPin = PointAnnotation(coordinate: context.coordinate)
                    .image(named: "MapPin")
                viewModel.pinCoordinates = context.coordinate
            }
            
            mapAddOns()
        }
        .ignoresSafeArea()
    }
    
    func mapButtons() -> some View {
        VStack {
            StyleMapButton()
            
            ResizeMapButton() {
                withViewportAnimation(.easeIn(duration: 1)) {
                    viewModel.resetViewPort()
                }
            }
            
            if let _ = viewModel.mapPin {
                RemovePinMapButton() {
                    viewModel.resetMapPin()
                }
            }
        }
    }
    
    func mapAddOns() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            if viewModel.pinCoordinates != nil {
                CoordinatesMapView(coordinates: $viewModel.pinCoordinates)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
            
            mapButtons()
        }
        .padding(8)
        .padding(.top, 90)
        .animation(.easeInOut(duration: 0.3), value: viewModel.pinCoordinates)
    }
}

#Preview {
    MainMapView()
}

private class ViewModel: ObservableObject {
    @Published var mapPin: PointAnnotation?
    @Published var pinCoordinates: CLLocationCoordinate2D?
    let initialCoordinates = CLLocationCoordinate2D(latitude: 41.9798, longitude: -87.90844)
    let zoom = 11.85
    @Published var initialViewport: Viewport
    
    init() {
        initialViewport = .camera(center: CLLocationCoordinate2D(latitude: initialCoordinates.latitude, longitude: initialCoordinates.longitude), zoom: zoom)
    }
    
    func resetMapPin() {
        mapPin = nil
        pinCoordinates = nil
        // Perform additional actions if needed after resetting the map pin
    }
    
    func resetViewPort() {
        initialViewport = .camera(
            center: CLLocationCoordinate2D(
                latitude: initialCoordinates.latitude,
                longitude: initialCoordinates.longitude),
            zoom: zoom,
            bearing: 0
        )
    }
}
