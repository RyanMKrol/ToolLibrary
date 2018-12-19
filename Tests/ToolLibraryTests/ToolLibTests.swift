import XCTest
@testable import ToolLib

final class ToolLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ToolLib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
