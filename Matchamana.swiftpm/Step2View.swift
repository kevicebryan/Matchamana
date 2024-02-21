//
//  Step2View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SpriteKit
import SwiftUI

struct Step2View: View {
    @ObservedObject var matchamana = Matchamana.shared

    var gameScene: SKScene {
        let gameScene = Step2GameScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        return gameScene
    }

    var body: some View {
        VStack {
            Text("Step 2")
                .font(.system(size: 60))
                .padding(.top, 50)

            HStack(spacing: 40) {
                StepsComponent(currentStep: 2)
                    .padding(40)
                    .offset(x: 25)
                NoteComponent(
                    header: "The secret recipe",
                    instruction: "Put all the ingredient into the matcha bowl using the spoon!",
                    note: "you can also add sugar here")
                    .padding(40)
            }
            .background(.background)
            .zIndex(2)

            ZStack {
                SpriteView(scene: gameScene)
                    .scaledToFit()
                    .ignoresSafeArea()

                if matchamana.step2Done {
                    NavigationLink(destination: Step3View()) {
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

                HStack(spacing: 12) {
                    Text("1 tsp chosen matcha powder")
                        .frame(maxWidth: 125)
                        .font(.system(size: 13,
                                      weight: .semibold,
                                      design: .monospaced))

                    Text("2 drops vanilla extract")
                        .frame(maxWidth: 70)
                        .font(.system(size: 13,
                                      weight: .semibold,
                                      design: .monospaced))

                    Text("200ml of hot water ")
                        .font(.system(size: 13,
                                      weight: .semibold,
                                      design: .monospaced))
                        .frame(maxWidth: 80)
                }
                .padding(.top, 400)
                .padding(.leading, 220)

                Text("'pour here'")
                    .padding(.trailing, 200)
                    .font(.system(size: 10,
                                  weight: .semibold,
                                  design: .monospaced))
                    .italic()
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
            .background(.white)
            .zIndex(1.0)
        }
    }
}

#Preview {
    Step2View()
}
