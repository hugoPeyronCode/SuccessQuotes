//
//  CategoriesView.swift
//  SuccessQuotes
//
//  Created by Hugo Peyron on 22/06/2024.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        ScrollView {
            Text("Categories")
                .font(.title)
                .padding()
            LazyVGrid(columns: [GridItem(.adaptive(minimum: SizeConstants.screenWidth / 3))], spacing: 10) { // Adjust the spacing value as needed
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")
                CategoryCard(categoryName: "test", categoryImage: "test")

            }
            .padding(10)
        }
        .monospaced()
    }
}


#Preview {
    CategoriesView()
}


struct CategoryCard : View {
    
    let categoryName: String
    let categoryImage : String
    
    var body: some View {
        Image(categoryName)
            .resizable()
            .frame(width: SizeConstants.screenWidth / 3, height: SizeConstants.screenWidth / 3)
            .background(.thinMaterial)
            .overlay {
                Text(categoryName)
                    .monospaced()
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        
    }
}
