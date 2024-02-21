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
    @State private var isRotating = -360.0

    var gameScene: SKScene {
        let gameScene = Step4GameScene()
        gameScene.size = CGSize(width: 600, height: 600)
        gameScene.scaleMode = .aspectFit
        gameScene.anchorPoint = CGPoint(x: 0, y: 0)
        return gameScene
    }

    var body: some View {
        VStack {
            if matchamana.step4Done {
                ZStack {
                    CircularText(radius: 160, text: "Enjoy your self-made matcha latte!")
                        .rotationEffect(.degrees(isRotating))
                        .onAppear {
                            withAnimation(.linear(duration: 12)
                                .repeatForever(autoreverses: false))
                            {
                                isRotating = 0
                            }
                        }
                        .scaleEffect(2.1)
                        .padding(.top, 650)

                    VStack {
                        Spacer()

                        VStack {
                            Text("Teariffic")
                                .font(.system(size: 100, weight: .regular, design: .monospaced))
                            Text("congrats on creating your very own matcha!")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .foregroundStyle(Color("Accent"))
                        }
                        .frame(width: 600, height: 400)
                        .padding(.bottom, 120)

                        Spacer()

                        Image("Glass Ice Matcha Latte \(matchamana.powder.rawValue)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 450)

                        Rectangle().frame(width: UIScreen.main.bounds.width,
                                          height: 20)
                            .padding(.top, -8)
                            .padding(.bottom, -8)
                            .zIndex(2)

                        ZStack {
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
                                .simultaneousGesture(TapGesture().onEnded {
                                    matchamana.step2Done = false
                                    matchamana.step3Done = false
                                    matchamana.step4Done = false
                                })
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                        .background(.background)
                    }
                }
            }
            else {
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

                        HStack(spacing: 40) {
                            Text("200ml of matcha")
                                .font(.system(size: 15, weight: .semibold, design: .monospaced))
                                .rotationEffect(.degrees(15))
                                .padding(.top, 60)

                            Text("200ml of oatmilk")
                                .font(.system(size: 15, weight: .semibold, design: .monospaced))
                                .rotationEffect(.degrees(15))
                                .padding(.top, -150)
                        }.padding(.leading, 280)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 600)
                    .background(.white)
                    .zIndex(1.0)
                }
            }
        }.animation(.easeIn(duration: 0.8), value: matchamana.step4Done)
            .onAppear {
                imageName = "Glass Ice Matcha Latte \(matchamana.powder.rawValue)"
            }
    }
}

#Preview {
    Step4View()
}
