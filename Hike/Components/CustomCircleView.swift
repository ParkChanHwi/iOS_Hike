//
//  CustomCircleView.swift
//  Hike
//
//  Created by 박찬휘 on 1/21/25.
// 원들이 원 밖으로 벗어나 있는 거 해결 ->  마스킹

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient:Bool = false
        
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [
                        .pink,
                        .customIndigoMedium,
                        .customSalmonLight
                    ],
                                   startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle() // toggle method is change variable false to true
                    }
                }
            MotionAnimationView()
        } // : ZStack
        .frame(width: 256,height: 256)
    }
}

#Preview {
    CustomCircleView()
}
