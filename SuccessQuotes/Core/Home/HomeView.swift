//
//  HomeView.swift
//  SuccessQuotes
//
//  Created by Hugo Peyron on 22/06/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var offset: CGFloat = -393
    @State private var currentPage: Int = 1

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    CategoriesView()
                        .frame(width: geometry.size.width)
                    SwipeView()
                        .frame(width: geometry.size.width)
                    AuthorsListView()
                        .frame(width: geometry.size.width)
                }
                .offset(x: self.offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.offset = -CGFloat(self.currentPage) * geometry.size.width + value.translation.width
                        }
                        .onEnded { value in
                            let threshold = geometry.size.width / 2
                            if value.predictedEndTranslation.width > threshold && self.currentPage > 0 {
                                self.currentPage -= 1
                            } else if value.predictedEndTranslation.width < -threshold && self.currentPage < 2 {
                                self.currentPage += 1
                            }
                            withAnimation {
                                self.offset = -CGFloat(self.currentPage) * geometry.size.width
                            }
                        }
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
