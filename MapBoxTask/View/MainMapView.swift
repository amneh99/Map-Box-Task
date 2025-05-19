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
            }
            .onCameraChanged { cameraChanged in
                DispatchQueue.main.async {
                    viewModel.mapCoordinates = cameraChanged.cameraState.center
                }
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
            CoordinatesMapView(coordinates: $viewModel.mapCoordinates, initialCoordinates: viewModel.initialCoordinates)
            
            mapButtons()
        }
        .padding(8)
        .padding(.top, 90)
    }
}

struct CoordinatesMapView: View {
    @Binding var coordinates: CLLocationCoordinate2D?
    var initialCoordinates: CLLocationCoordinate2D
    
    var latitude: CGFloat {
        coordinates?.latitude ?? initialCoordinates.latitude
    }
    
    var longitude: CGFloat {
        coordinates?.longitude ?? initialCoordinates.longitude
    }
    
    var body: some View {
        HStack(spacing: 8) {
            cell(key: "latitude", value: String(format: "%.4f", latitude))
            cell(key: "longitude", value: String(format: "%.4f", longitude))
        }
    }
    
    func cell(key: String, value: String) -> some View {
        HStack(spacing: 4) {
            Text(key)
            Text(value)
        }
        .font(.system(size: 12, weight: .medium))
    }
}

#Preview {
    MainMapView()
}

private class ViewModel: ObservableObject {
    @Published var mapPin: PointAnnotation?
    @Published var mapCoordinates: CLLocationCoordinate2D?
    let initialCoordinates = CLLocationCoordinate2D(latitude: 41.9798, longitude: -87.90844)
    @Published var initialViewport: Viewport
    
    init() {
        initialViewport = .camera(center: CLLocationCoordinate2D(latitude: initialCoordinates.latitude, longitude: initialCoordinates.longitude), zoom: 11.85)
    }
    
    func resetMapPin() {
        mapPin = nil
        // Perform additional actions if needed after resetting the map pin
    }
    
    func resetViewPort() {
        initialViewport = .camera(
            center: CLLocationCoordinate2D(
                latitude: initialCoordinates.latitude,
                longitude: initialCoordinates.longitude),
            zoom: 11.85,
            bearing: 0
        )
    }
}
