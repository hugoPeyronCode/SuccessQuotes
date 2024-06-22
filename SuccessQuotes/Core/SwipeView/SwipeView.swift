//
//  SwipeView.swift
//  SuccessQuotes
//
//  Created by Hugo Peyron on 21/06/2024.
//

import SwiftUI

struct Quote : Hashable, Codable {
    let quote : String
    let author : String
    let years: String
}

struct SwipeView: View {
    
    let quotes = QuoteManager.shared.loadQuotes(fromFile: "quotes")
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.thinMaterial)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                ForEach(loadQuotes(), id: \.self) { quote in
                    QuoteView(quote)
                            .containerRelativeFrame([.horizontal, .vertical])
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
    
    
    var background : some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(.thinMaterial)
            .ignoresSafeArea()
    }
    
    
    
    func loadQuotes() -> [Quote] {
        if let quotes = QuoteManager.shared.loadQuotes(fromFile: "quotes") {
            return quotes.shuffled()
        } else { return [] }
    }
}

#Preview {
    SwipeView()
}


struct QuoteView : View {
    
    let quote : Quote
    
    init(_ quote: Quote) {
        self.quote = quote
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(quote.quote)
                .font(.title3)
            
            Text(quote.author)
                .padding()
            
            Text(quote.years)
                .font(.caption)
            
        }
        .padding()
        .monospaced()
    }
}


