//importing the required libraries
import Foundation

// Implementing the Decrypter protocol to swift
public class CrackStation: Decrypter{
    // declaring a swift library to load the json data into it
    private var dict = Dictionary<String,String>()

    required public init(){
        do{
            dict = try loadDictionaryFromDisk()
        }
        catch{
            dict = ["":""]
        }
    }

    public func decrypt(shaHash:String) -> String?{
        let value = dict[shaHash]
        return value       
    }

    private func loadDictionaryFromDisk() throws -> Dictionary<String,String>{
        guard let filepath = Bundle.module.url(forResource: "data", withExtension: "json") else {return ["":""]} 
        guard let json_data = try? Data(contentsOf: filepath) else {return ["":""]}
        let jsonResult = try? JSONSerialization.jsonObject(with: json_data)
        guard let table = jsonResult as? Dictionary<String, String> else { return ["":""]}
        return table
    }

}