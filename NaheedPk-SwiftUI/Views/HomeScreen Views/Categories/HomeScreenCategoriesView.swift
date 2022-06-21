//
//  HomeScreenCategoriesView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 19/06/2022.
//

import SwiftUI

struct HomeScreenCategoriesView: View {
//    var appCategories: [AppCategories] = [AppCategories]()
    var body: some View {
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 30, pinnedViews: []) {
            ForEach(AppCategoriesJSON, id: \.self) { category in
                CategoryView(category: category)
                    .onTapGesture {
                        debugPrint(category.title)
                    }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(width: UIScreen.main.bounds.width)
        .frame(height: 300)
    }
}

struct HomeScreenCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCategoriesView()
            .previewLayout(.sizeThatFits)
    }
}
