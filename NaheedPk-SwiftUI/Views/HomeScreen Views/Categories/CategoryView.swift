//
//  CategoryView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 19/06/2022.
//

import SwiftUI

struct CategoryView: View {
    var category: AppCategories
    var body: some View {
        VStack(spacing: 4) {
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text(category.title)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .frame(width: 90, height: 42, alignment: .center)
                .lineLimit(2)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: AppCategoriesJSON[0])
            .previewLayout(.sizeThatFits)
    }
}
