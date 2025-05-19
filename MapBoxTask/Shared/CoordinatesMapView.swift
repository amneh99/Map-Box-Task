//
//  CoordinatesMapView.swift
//  MapBoxTask
//
//  Created by Amneh Shalabyeh on 5/19/25.
//

import SwiftUI
import MapboxMaps

struct CoordinatesMapView: View {
    @Binding var coordinates: CLLocationCoordinate2D?
    
    var body: some View {
        if let coordinates {
            HStack(spacing: 8) {
                cell(key: "latitude", value: String(format: "%.4f", coordinates.latitude))
                cell(key: "longitude", value: String(format: "%.4f", coordinates.longitude))
            }
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
