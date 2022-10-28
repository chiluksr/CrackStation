import XCTest
@testable import CrackStation

final class codeTests: XCTestCase {
    func testforCrackStation() throws {
        //load the plain text into Table variable 
        let Table = try CrackStation.loadDictionaryFromDisk(key: "84a516841ba77a5b4648de2cd0dfcb30ea46dbb4")
        // check if the Table is nil or not
        if Table == "nil"{
            print("nil")
        }
        else{
            print(Table)
        }
    }
}
