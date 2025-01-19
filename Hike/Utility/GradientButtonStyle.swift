//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by 박찬휘 on 1/20/25.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //Conditional Statement with Nil Coalescing
                // Condiition ? A : B
                configuration.isPressed ?
                // A: When user pressed the Button (True)
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                : 
                // B: When the Button is not pressed (False)
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
