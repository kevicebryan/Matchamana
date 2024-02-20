//
//  NoteComponent.swift
//  Matchamana
//
//  Created by Kevin Bryan on 19/02/24.
//

import SwiftUI

struct NoteComponent: View {
    let header: String
    let instruction: String
    let note: String

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(header).padding(.top, 48)
                    .font(.system(size: 24, weight: .regular, design: .monospaced))

                Text(instruction)
                    .font(.system(size: 32, weight: .bold, design: .monospaced))
                    .padding(.top, 24)

                Spacer()

                Text(note)
                    .padding(.bottom, 24)
                    .foregroundColor(Color("Accent"))
                    .font(.system(size: 20, weight: .bold, design: .monospaced))

            }.padding(.horizontal, 20)
        }
        .frame(width: 500, height: 350)
        .background(Color("NoteBackground"))
    }
}

#Preview {
    NoteComponent(header: "Start by picking your Matcha Powder", instruction: "Tap which powder you would like to use", note: "the greener the color the higher quality and the stonger the flavor")
}
