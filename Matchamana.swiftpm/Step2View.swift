//
//  Step2View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SwiftUI

struct Step2View: View {
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

            VStack(spacing: 0) {}
                .frame(width: UIScreen.main.bounds.width, height: 600)
                .background(.thinMaterial)
        }
    }
}

#Preview {
    Step2View()
}
