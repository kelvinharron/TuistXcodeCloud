import SwiftUI

public struct ContentView: View {
    let macroString = "Hello, World!"

    init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
            .onAppear {}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
