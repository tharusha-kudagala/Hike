//
//  ButtonGradient.swift
//  Hike
//
//  Created by Tharusha Kudagala on 2023-08-14.
//

import Foundation
import SwiftUI

struct ButtonGradient: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(
                configuration.isPressed ? .colorGrayMedium : .colorGrayLight
            )
            .cornerRadius(40)
    }
}
