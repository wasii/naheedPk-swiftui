//
//  GridParentView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct GridParentView: View {
//    var title: String
    var categoryProduct: [CategoryProduct]?
    var body: some View {
        VStack {
            TitleView(title: categoryProduct., shouldHideButton: false)
            VStack {
                LazyVGrid(columns: gridLayouts, alignment: .center, spacing: 0, pinnedViews: []) {
                    ForEach(categoryProduct!, id: \.self) { product in
                        GridItemView()
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
            Image("grid-background")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
}

struct GridParentView_Previews: PreviewProvider {
    static var previews: some View {
        GridParentView()
            .previewLayout(.sizeThatFits)
    }
}
