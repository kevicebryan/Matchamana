//
//  StepsComponent.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SwiftUI

struct StepsComponent: View {
    let currentStep: Int

    var body: some View {
        VStack(spacing: 0) {
            Circle()
                .fill(currentStep == 1 ? Color("Background") : Color.black)
                .overlay(Image("Powder Ceremonial")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24))
                .frame(width: 60, height: 60)
                .offset(x: -20, y: 10)
                .zIndex(2)

            Rectangle().frame(width: 4, height: 50)
                .rotationEffect(.degrees(-15))
                .padding(.vertical, -2)
                .zIndex(1)

            Circle()
                .fill(currentStep == 2 ? Color("Background") : Color.black)
                .overlay(
                    Image("Bowl Done 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24))
                .frame(width: 60, height: 60)
                .offset(x: 15, y: -5)
                .zIndex(2)

            Rectangle().frame(width: 4, height: 40)
                .rotationEffect(.degrees(20))
                .padding(.vertical, -8)
                .zIndex(1)

            Circle()
                .fill(currentStep == 3 ? Color("Background") : Color.black)
                .frame(width: 60, height: 60)
                .overlay(Image("Chasen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24))
                .offset(x: -15, y: -5)
                .zIndex(2)

            Rectangle().frame(width: 4, height: 50)
                .rotationEffect(.degrees(-30))
                .padding(.vertical, -8)
                .zIndex(1)

            Circle()
                .fill(currentStep == 4 ? Color("Background") : Color.black)
                .overlay(Image("Matcha Latte Ceremonial")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24))
                .frame(width: 60, height: 60)
                .offset(x: 10, y: -12)
                .zIndex(1)
        }
    }
}

#Preview {
    StepsComponent(currentStep: 1)
}
