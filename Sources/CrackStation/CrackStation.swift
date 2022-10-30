import Foundation
import Glibc
import XCTest

public class CrackStation: Decrypter{
    var lookupTable: [String: String]=[:]
    required public init(){        
    }
    public func decrypt(shaHash:String)->String?{
       let password = try? CrackStation().loadDictionaryFromDisk(key: shaHash)
       return password
    }
    private func loadDictionaryFromDisk(key: String) throws -> String? {
        guard let path = Bundle.module.url(forResource: "sha", withExtension: "json") else { return "nil" }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        

        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            let ans = lookupTable[key]
            if ans == nil{
                 return nil
            }
            else{
               return ans!
            }
        }
        else{
            return nil
        }
    }
}
