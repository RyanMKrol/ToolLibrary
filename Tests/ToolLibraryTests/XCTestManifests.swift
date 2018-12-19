import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ToolLibTests.allTests),
    ]
}
#endif