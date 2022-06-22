//
//  CodableBundleExtension.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 18/06/2022.
//

import Foundation
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        //1. Locate JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) file in bundle")
        }
        
        //2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) file from bundle")
        }
        
        //3. create a decoder.
        let decode = JSONDecoder()
        
        //4. create a property 'decodedData' for the decoded data
        do {
            let loadedData = try decode.decode(T.self, from: data)
//            debugPrint(loadedData)
            return loadedData
        }  catch let DecodingError.dataCorrupted(context) {
            print(context)
            fatalError()
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            fatalError()
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            fatalError()
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            fatalError()
        } catch {
            print("error: ", error)
            fatalError()
        }
    }
}
