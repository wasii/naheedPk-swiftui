//
//  GridParentView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI
struct GridParentView: View {
//    var title: String
    var categoryProduct: CategoryDataClass
    var body: some View {
        VStack {
            TitleView(title: categoryProduct.gridTitle ?? "", shouldHideButton: false)
            VStack {
                LazyVGrid(columns: gridLayouts, alignment: .center, spacing: 0, pinnedViews: []) {
                    ForEach(categoryProduct.products!, id: \.self) { product in
                        GridItemView(product: product)
                    }
                }
            }
            .padding(.vertical, 0)
            .padding(.horizontal,3)
            .background(
                Color.white
                    .cornerRadius(12)
            )
        }
        .padding()
        .background(
            WebImage(url: URL(string: categoryProduct.background!)!)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
}

//struct GridParentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridParentView()
//            .previewLayout(.sizeThatFits)
//    }
//}
