//
//  MapButtonView.swift
//  MapBoxTask
//
//  Created by Amneh Shalabyeh on 5/19/25.
//

import SwiftUI

struct MapButtonView: View {
    var iamge: ImageResource
    var bgColor: Color = .mainGreen
    var borderColor: Color = .white
    
    var body: some View {
        ZStack {
            Circle()
                .fill(bgColor)
                .overlay {
                    Image(iamge)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .padding(10)
                }
            
            Circle()
                .stroke(lineWidth: 1)
                .foregroundStyle(borderColor)
        }
        .frame(width: 45, height: 45)
    }
}

#Preview {
    MapButtonView(iamge: .lightMode)
}
