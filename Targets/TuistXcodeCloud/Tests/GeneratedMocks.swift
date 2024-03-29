///
/// @Generated by Mockolo
///



import SwiftUI
import TuistXcodeCloudUI
@testable import TuistXcodeCloud


class FooMockMock: FooMock {
    init() { }


    private(set) var onSetCallCount = 0
    var onSetHandler: (() -> ())?
    func onSet()  {
        onSetCallCount += 1
        if let onSetHandler = onSetHandler {
            onSetHandler()
        }
        
    }

    private(set) var didChangeCallCount = 0
    var didChangeHandler: (() -> ())?
    func didChange()  {
        didChangeCallCount += 1
        if let didChangeHandler = didChangeHandler {
            didChangeHandler()
        }
        
    }
}

