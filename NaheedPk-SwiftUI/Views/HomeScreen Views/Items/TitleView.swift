//
//  TitleView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.medium)
            Spacer()
        }// : HStack
//        .padding(.horizontal)
        .padding(.top, 5)
        .padding(.bottom, 20)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Trending Brands")
            .previewLayout(.sizeThatFits)
            .background(Color.clear)
    }
}
