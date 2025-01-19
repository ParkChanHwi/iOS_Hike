//
//  MotionAnimationView.swift
//  Hike
//
//  Created by 박찬휘 on 1/21/25.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    // MARK : FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCordinate() -> CGFloat {
        return CGFloat.random(in: 0...256) // SwiftUI에서 어떤 뷰든 정확한 위치를 저장하고 싶다면 x y 좌표에대해 CG부동점 사용
    }
    
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in:0.05...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCordinate(),
                        y: randomCordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                            
                        }
                    })
            }
        }//:ZSTACK
        .frame(width: 256,height: 256)
        .mask(Circle())
        .drawingGroup() // High Performance Rendering
        // SwiftUI는 기본값으로 뷰 렌더링에 코어 애니메이션을 사용한다. but 복잡한 애니메이션일때 코드가 느려질 수 있는데 이를 drawingGroup으로 해결
        // 원리: 콘텐츠를 단일 렌더링 출력 형태로 스크린에 반환하기 전애 화면 밖 이미지로 렌더링
        // 메탈 : 고속 그래픽을 위해 GPU와 직접 장동하는 APPLE의 기본 프레임워크
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background{
                Circle()
                    .fill(.teal)
            }
//        ZStack{
//            Color.teal.ignoresSafeArea()
//            
//            MotionAnimationView()
//        }// : ZSTACK
    }
}
