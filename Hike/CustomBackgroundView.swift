//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-13.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack{
            Color.customDarkGreen
                .cornerRadius(40)
                .offset(y: 12)
            Color.customLightGreen
                .cornerRadius(40)
                .offset(y: 3)
            
            LinearGradient(colors: [Color.customLightGreen,
                                    Color.customMediumGreen],
                           startPoint: .top,
                           endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
