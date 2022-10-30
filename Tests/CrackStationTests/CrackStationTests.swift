import XCTest
import CrackStation

final class codeTests: XCTestCase {
    func testforCrackStation() throws {
        //load the plain text into Table variable 
        let x = try CrackStation().decrypt(shaHash: "84a516841ba77a5b4648de2cd0dfcb30ea46dbb4")
        // check if the Table is nil or not
        if x == nil{
            print("nil")
        }
        else{
            print(x)
        }
        XCTAssertEqual(x,"c")
    }
}
