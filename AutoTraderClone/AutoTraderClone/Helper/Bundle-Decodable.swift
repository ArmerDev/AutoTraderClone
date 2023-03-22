//
//  Bundle-Decodable.swift
//  AutoTraderClone
//
//  Created by James Armer on 26/12/2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T? {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "y-MM-dd"
            decoder.dateDecodingStrategy = .formatted(formatter)
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            print("Failed to load and decode JSON \(error)")
            return nil
        }

    }
}
