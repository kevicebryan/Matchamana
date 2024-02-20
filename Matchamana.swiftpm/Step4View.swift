//
//  Step4View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SpriteKit
import SwiftUI

struct Step4View: View {
    var gameScene: SKScene {
        let gameScene = Step4GameScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        return gameScene
    }

    var body: some View {
        VStack {
            Text("Step 4")
                .font(.system(size: 60))
                .padding(.top, 50)

            HStack(spacing: 40) {
                StepsComponent(currentStep: 4)
                    .padding(40)
                    .offset(x: 25)

                NoteComponent(
                    header: "Almost done",
                    instruction: "Add the matcha and remaining ingredients into a glass!",
                    note: "matcha is best enjoyed with plant-based milk e.g. oat, soy and almond")

                    .padding(40)
            }
            .background(.background)
            .zIndex(2)

            VStack(spacing: 0) {
                SpriteView(scene: gameScene)
                    .scaledToFit()
                    .ignoresSafeArea()
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
            .background(.white)
            .zIndex(1.0)
        }
    }
}

#Preview {
    Step4View()
}
