//
//  BlocksView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct BlocksView: View {
//    let blocks: DashboardCategories
    let images: [String] = ["block-1", "block-2", "block-3"]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleView(title: "Trending Brands", shouldHideButton: true)
            VStack(spacing: 12) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .frame(height: 100)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.4), radius: 5.0, x: 0, y: 0)
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct BlocksView_Previews: PreviewProvider {
    static var previews: some View {
        BlocksView()
            .previewLayout(.sizeThatFits)
    }
}
