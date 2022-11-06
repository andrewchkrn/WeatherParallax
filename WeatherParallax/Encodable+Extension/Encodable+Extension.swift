//
//  Encodable+Extension.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import Foundation

//MARK: - Encodable
extension Encodable {
    
    // MARK: - Properties
    var asDictionary: [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                print("EncodableExtension | Error during encoding | \(self)")
                return [:]
            }
            return dictionary
        } catch let error {
            print("EncodableExtension | Error during encoding | \(error)")
            return [:]
        }
    }
}
