//
//  Step3View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SpriteKit
import SwiftUI

struct Step3View: View {
    @ObservedObject var matchamana = Matchamana.shared

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

            ZStack {
                SpriteView(scene: gameScene)
                    .scaledToFit()
                    .ignoresSafeArea()

                if matchamana.step3Done {
                    NavigationLink(destination: Step4View()) {
                        Text("Next Step")
                            .font(.largeTitle)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color("Accent"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 320)
                }

                Text("Whisk from\nhere     to      here").multilineTextAlignment(.center)
                    .font(.system(size: 20,
                                  weight: .semibold,
                                  design: .monospaced))
                    .padding(.top, -60)
                    .padding(.trailing, 120)
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
