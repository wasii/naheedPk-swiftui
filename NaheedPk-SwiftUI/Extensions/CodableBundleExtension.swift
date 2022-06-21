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
        guard let decodedData = try? decode.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        //5. return the ready-to-use dat
        return decodedData
    }
}
