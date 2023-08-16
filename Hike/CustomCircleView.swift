//
//  CustomCircleView.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-14.
//

import SwiftUI

struct CustomCircleView: View {
    @State var isAnimatedGradient: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [ Color(.colorIndigoMedium), Color(.colorSalmonLight)], startPoint: isAnimatedGradient ? .topTrailing : .bottomTrailing, endPoint: isAnimatedGradient ? .bottomLeading : .topLeading)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimatedGradient.toggle()
                    }
                }
            MotionAnimationView()
            
        }.frame(width: 300)
    }
}

#Preview {
    CustomCircleView()
}
