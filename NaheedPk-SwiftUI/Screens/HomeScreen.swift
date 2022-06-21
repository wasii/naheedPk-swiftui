//
//  HomeScreen.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI
struct HomeScreen: View {
//    @ObservedObject var appDashboard: HomeScreenDashboardViewModel
//    
//    init() {
//        self.appDashboard = HomeScreenDashboardViewModel()
//    }
    var body: some View {
        VStack(spacing: 0) {
            HomeNavigationView()
                .frame(maxWidth: .infinity)
                .background(Color(NativeBlueColor).edgesIgnoringSafeArea(.top))
                .frame(maxWidth: .infinity)
            SearchBarView(searchTextFieldValue: "")
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    HomeScreenCarousel()
                        .frame(height: UIScreen.main.bounds.width / 1.8)
                    HomeScreenCategoriesView()
                        .frame(width: UIScreen.main.bounds.width)
                    BlocksView()
                        
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewDevice("iPhone 8")
    }
}
