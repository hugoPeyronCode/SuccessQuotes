//
//  JSONDecoder.swift
//  SuccessQuotes
//
//  Created by Hugo Peyron on 22/06/2024.
//

import Foundation

class QuoteManager {
    static let shared = QuoteManager()
    
    private init() {}
    
    func loadQuotes(fromFile filename: String) -> [Quote]? {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("File not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let quotes = try decoder.decode([Quote].self, from: data)
            return quotes
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
