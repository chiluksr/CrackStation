//importing the required libraries
import Foundation

// Implementing the Decrypter protocol to swift
public class CrackStation: Decrypter{
    // declaring a swift library to load the json data into it
    private let hashes_to_plaintextDictionary: [String:String]

    required public init(){
        do{
            hashes_to_plaintextDictionary = try CrackStation.loadDictionaryFromDisk()
        }
        catch{
            hashes_to_plaintextDictionary = [:]
        }
    }

    public func decrypt(shaHash:String) -> String?{
        let plain_text_password = hashes_to_plaintextDictionary[shaHash]
        return plain_text_password       
    }

    static func loadDictionaryFromDisk() throws -> Dictionary<String,String>{
        guard let json_file_path = Bundle.module.url(forResource: "data", withExtension: "json") else {return ["":""]} 
        guard let json_data = try? Data(contentsOf: json_file_path) else {return ["":""]}
        let jsonResult = try? JSONSerialization.jsonObject(with: json_data)
        guard let hash_table = jsonResult as? Dictionary<String, String> else { return ["":""]}
        return hash_table
    }

}