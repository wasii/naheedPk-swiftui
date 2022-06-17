//
//  HomeView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HomeNavigationView()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                SearchBarView(searchTextFieldValue: "")
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
        .background(Color(NativeBlueColor).edgesIgnoringSafeArea(.all))
        .embedNavigationView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone X")
    }
}
