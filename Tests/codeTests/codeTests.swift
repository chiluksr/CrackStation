import XCTest
@testable import CrackStation

final class codeTests: XCTestCase {
    func testLoadingLookupTableFromDisk() throws {
        let value = CrackStation().decrypt(shaHash: "e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98")
        print(value as Any)
        XCTAssertEqual(value,"b")
    }
}