import SwiftUI
import TuistXcodeCloudUI

@main
struct TuistXcodeCloudApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/// @mockable
protocol FooMock {
    func onSet()
    func didChange()
}
