//
//  ResizeMapButton.swift
//  MapBoxTask
//
//  Created by Amneh Shalabyeh on 5/19/25.
//

import SwiftUI

struct ResizeMapButton: View {
    var callBack: () -> Void = {}
    
    var body: some View {
        Button {
            callBack()
        } label: {
            MapButtonView(iamge: .resize)
        }
    }
}

#Preview {
    ResizeMapButton()
}
