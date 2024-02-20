//
//  Step3View.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SwiftUI

struct Step3View: View {
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

            VStack(spacing: 0) {}
                .frame(width: UIScreen.main.bounds.width, height: 600)
                .background(.thinMaterial)
        }
    }
}

#Preview {
    Step3View()
}
