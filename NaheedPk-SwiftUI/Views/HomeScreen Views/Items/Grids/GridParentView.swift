//
//  GridParentView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct GridParentView: View {
    var body: some View {
        VStack {
            TitleView(title: "Mobile Phones", shouldHideButton: false)
            VStack {
                LazyVGrid(columns: gridLayouts, alignment: .center, spacing: 3, pinnedViews: []) {
                    GridItemView()
                    GridItemView()
                    GridItemView()
                    GridItemView()
                }
            }.background(
                Color.white
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
