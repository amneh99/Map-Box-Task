//
//  StyleMapButton.swift
//  MapBoxTask
//
//  Created by Amneh Shalabyeh on 5/19/25.
//

import SwiftUI

struct StyleMapButton: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
        
    var body: some View {
        Button {
            isDarkMode.toggle()
        } label: {
            MapButtonView(iamge: isDarkMode ? .lightMode : .darkMode)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    StyleMapButton()
}
