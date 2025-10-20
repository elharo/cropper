import XCTest

final class CropperUITests: XCTestCase {
    
    func testSimpleArithmetic() throws {
        // XCUITest that verifies 1+1 equals 2
        // This is a UI test that happens to test arithmetic,
        // as requested in the issue
        let result = 1 + 1
        XCTAssertEqual(result, 2, "1 + 1 should equal 2")
    }
}
