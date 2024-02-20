//
//  Step1View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SwiftUI

struct Step1View: View {
    var body: some View {
        VStack {
            Text("Step 1")
                .font(.system(size: 60))
                .padding(.top, 50)

            HStack(spacing: 40) {
                StepsComponent(currentStep: 1)
                    .padding(40)
                    .offset(x: 25)
                NoteComponent(header: "Start by picking your Matcha Powder", instruction: "Tap which powder you would like to use!", note: "the greener the color, the higher the quality, and the stronger the flavor")
                    .padding(40)
            }

            VStack(spacing: 0) {
                Spacer()
                HStack(spacing: 80) {
                    NavigationLink(destination: Step2View()) {
                        Image("Matcha Box Culinary")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)

                    }.gesture(TapGesture().onEnded {
                        Matchamana.shared.powder = "culinary"
                    })

                    NavigationLink(destination: Step3View()) {
                        Image("Matcha Box Premium")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }.gesture(TapGesture().onEnded {
                        Matchamana.shared.powder = "premium"
                    })

                    NavigationLink(destination: Step4View()) {
                        Image("Matcha Box Ceremonial")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }.gesture(TapGesture().onEnded {
                        Matchamana.shared.powder = "ceremenial"
                    })

                }.padding(.bottom, -8)

                Rectangle()
                    .frame(
                        width: UIScreen.main.bounds.width, height: 16)
                    .background(.primary)
                    .padding(.bottom, 120)
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
            .background(.thinMaterial)
        }
    }
}

#Preview {
    Step1View()
}
