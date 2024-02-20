//
//  Step4View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SpriteKit
import SwiftUI

struct Step4View: View {
    @ObservedObject var matchamana = Matchamana.shared
//    @State private var isFinish = true

    @State var imageName: String = ""

    var gameScene: SKScene {
        let gameScene = Step4GameScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        return gameScene
    }

    var body: some View {
        VStack {
            if !matchamana.step4Done {
                ZStack {
                    VStack {
                        VStack {
                            Text("Teariffic")
                                .font(.system(size: 80, weight: .regular, design: .monospaced))
                            Text("congrats on creating your very own matcha!")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .foregroundStyle(Color("Accent"))
                        }
                        .frame(width: 600, height: 400)
                        .background(Color("NoteBackground"))
                        .padding(.bottom, 300)

                        Image("Glass Ice Matcha Latte \(matchamana.powder.rawValue)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)

                        Rectangle().frame(width: .infinity, height: 20)
                            .padding(.top, -8)
                            .padding(.bottom, 20)

                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                Text("Star Over")
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 10)
                                    .background(Color("Accent"))
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                        ).navigationBarBackButtonHidden(true)
                    }
                    CircularText(radius: 160, text: "Enjoy your self-made matcha latte!")
                        .scaleEffect(2)
                        .padding(.top, 600)
                }
            } else {
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
                            note: "matcha is best enjoyed with plant-based milk e.g. oat, soy and almond"
                        )

                        .padding(40)
                    }
                    .background(.background)
                    .zIndex(2)

                    ZStack {
                        SpriteView(scene: gameScene)
                            .scaledToFit()
                            .ignoresSafeArea()

                        Text("A 1:1 ratio is the best for matcha latte\n100ml matcha & 100ml milk")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                            .padding(.top, 400)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 600)
                    .background(.white)
                    .zIndex(1.0)
                }
            }
        }.animation(.easeIn(duration: 0.5), value: matchamana.step4Done)
            .onAppear {
                imageName = "Glass Ice Matcha Latte \(matchamana.powder.rawValue)"
            }
    }
}

#Preview {
    Step4View()
}
