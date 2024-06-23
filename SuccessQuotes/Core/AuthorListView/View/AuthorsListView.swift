//
//  AuthorsListView.swift
//  SuccessQuotes
//
//  Created by Hugo Peyron on 22/06/2024.
//

import SwiftUI

struct AuthorsListView: View {
    var body: some View {
        List {
            ForEach (loadUniqueAuthors(), id: \.self) { author in
                Text(author)
                    .monospaced()
            }
        }
    }
    
    func loadUniqueAuthors() -> [String] {
        if let quotes = QuotesManager.shared.loadQuotes(fromFile: "quotes") {
            let uniqueAuthors = Set(quotes.map { $0.author })
            print(uniqueAuthors.description)
            return uniqueAuthors.sorted()
        } else { return [] }
    }
}

#Preview {
    AuthorsListView()
}
