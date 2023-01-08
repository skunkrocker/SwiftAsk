import XCTest
import TSCBasic
@testable import SwiftAsk

final class SwiftAskTests: XCTestCase {
    
    /*
     func testExample() throws {
     // This is an example of a functional test case.
     // Use XCTAssert and related functions to verify your tests produce the correct
     // results.
     XCTAssertEqual(SwiftAsk().text, "Hello, World!")
     }
     */
    func textSay() {
        say("Hello world",  color: .blue, style: .underline, backGround: .yellow)
    }
}
