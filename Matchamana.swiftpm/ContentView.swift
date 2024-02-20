import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("MATCHAmana")
                    .font(.system(size: 80, design: .monospaced))
                HStack {
                    Text("Enjoy the")
                    Text("zenful")
                        .foregroundStyle(Color("Accent"))
                    Text("process of making matcha")
                }.padding(.bottom, 400)
                    .font(.system(size: 22))

                HStack {
                    VStack(alignment: .leading) {
                        Text("tap the matcha to begin!")
                        Image("Arrow")
                    }

                    Spacer()

                    NavigationLink(destination: Step1View()) {
                        Image("Matchamana")
                            .scaleEffect(0.75)
                    }
                }
            }
            .padding(100)
        }
    }
}
