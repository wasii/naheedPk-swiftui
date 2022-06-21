//
//  TitleView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct TitleView: View {
    var title: String
    @State var shouldHideButton = false
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24))
                .fontWeight(.medium)
            Spacer()
            Button(action: {}) {
                Text("View All")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .fontWeight(.medium)
            }
            .frame(width: 70, height: 35)
            .background(Color(NativeBlueColor))
            .cornerRadius(10)
            .opacity(shouldHideButton ? 0 : 1)
        }// : HStack
//        .padding(.horizontal)
        .padding(.top, 5)
        .padding(.bottom, 20)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Trending Brands", shouldHideButton: true)
            .previewLayout(.sizeThatFits)
            .background(Color.clear)
    }
}
