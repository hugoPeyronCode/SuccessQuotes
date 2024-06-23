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
    
    let quotes = QuotesManager.shared.loadQuotes(fromFile: "quotes")
    
    @State private var isMovingToCategoriesView : Bool = false
        
    var body: some View {
        
        ZStack {
            background
            scrollingQuotes
            moveToCategoriesButton
        }
        .sheet(isPresented: $isMovingToCategoriesView){
            CategoriesView()
                .background(.thinMaterial)
                .presentationDetents([.large])
        }
    }
    
    var background : some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(.thinMaterial)
            .ignoresSafeArea()
    }
    
    var scrollingQuotes : some View {
            ScrollView(.vertical) {
                ForEach(loadQuotes(), id: \.self) { quote in
                    QuoteView(quote)
                            .containerRelativeFrame([.horizontal, .vertical])
                }
            }
            .scrollTargetBehavior(.paging)
    }
    
    var moveToCategoriesButton: some View {
        VStack {
            Spacer()
            
            Button {
                 isMovingToCategoriesView.toggle()
            } label: {
                Image(systemName: "circle.grid.2x2.fill")
                    .font(.title3)
                    .padding()
                    .foregroundStyle(.foreground)
                    .background(.thinMaterial)
                    .clipShape(Circle())
            }
        }
    }
    
    func loadQuotes() -> [Quote] {
        if let quotes = QuotesManager.shared.loadQuotes(fromFile: "quotes") {
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


