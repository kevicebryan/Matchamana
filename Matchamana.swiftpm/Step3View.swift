//
//  Step3View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SpriteKit
import SwiftUI

struct Step3View: View {
    var gameScene: SKScene {
        let gameScene = Step3GameScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        return gameScene
    }

    var body: some View {
        VStack {
            Text("Step 3")
                .font(.system(size: 60))
                .padding(.top, 50)

            HStack(spacing: 40) {
                StepsComponent(currentStep: 3)
                    .padding(40)
                    .offset(x: 25)
                NoteComponent(
                    header: "The fun part",
                    instruction: "Use the chasen and whisk the matcha together!",
                    note: "30-45 seconds is the ideal whisking duration")
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
    Step3View()
}
