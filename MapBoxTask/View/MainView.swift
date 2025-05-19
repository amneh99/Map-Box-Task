//
//  MainView.swift
//  MapBoxTask
//
//  Created by Amneh Shalabyeh on 5/19/25.
//

import SwiftUI

struct MainView: View {
    @State private var currentScreen = CurrentScreen.splash
    @State private var opacity = 0.5
    
    var body: some View {
        Group {
            switch currentScreen {
            case .splash: SplashView().transition(.opacity)
            case .map: MainMapView().transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.6), value: currentScreen)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    currentScreen = .map
                }
            }
        }
    }
}

#Preview {
    MainView()
}

enum CurrentScreen {
    case splash
    case map
}
