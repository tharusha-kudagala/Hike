//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-15.
//

import SwiftUI

struct MotionAnimationView: View {
    @State var randomCircle: Int = Int.random(in: 6...12)
    @State var isAnimating: Bool = false
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomCoordinates() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 4...80))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: randomSize())
                    .opacity(0.25)
                    .position(x: randomCoordinates(), y: randomCoordinates())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25).repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                                isAnimating = true
                            }
                    })
                   
            }
        }
            .mask(Circle())
            .drawingGroup()
            .frame(width: 300, height: 300)
    }
}

#Preview {
    ZStack{
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
            .background(Circle().fill(.teal))
    }
}
