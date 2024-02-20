//
//  Step4View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SwiftUI

struct Step4View: View {
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

            VStack(spacing: 0) {}
                .frame(width: UIScreen.main.bounds.width, height: 600)
                .background(.thinMaterial)
        }
    }
}

#Preview {
    Step4View()
}
