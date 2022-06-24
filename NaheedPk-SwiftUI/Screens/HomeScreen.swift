//
//  HomeScreen.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI
struct HomeScreen: View {
    @ObservedObject var appDashboard: HomeScreenDashboardViewModel
    
    init() {
        self.appDashboard = HomeScreenDashboardViewModel()
    }
    var body: some View {
        VStack(spacing: 0) {
            HomeNavigationView()
                .frame(maxWidth: .infinity)
                .background(Color(NativeBlueColor).edgesIgnoringSafeArea(.top))
                .frame(maxWidth: .infinity)
            SearchBarView()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack {
                        if !self.appDashboard.appSliders.isEmpty {
                            HomeScreenCarousel(appSlider: self.appDashboard.appSliders)
                        } else {
                            ProgressView()
                        }
                    }.frame(height: UIScreen.main.bounds.width / 1.8)
                    VStack {
                        if !self.appDashboard.appCategories.isEmpty {
                            HomeScreenCategoriesView()
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(height: UIScreen.main.bounds.width / 1.3)
                    .frame(width: UIScreen.main.bounds.width)
                    VStack {
                        if !self.appDashboard.appDashboardGrids.isEmpty {
                            HomeGridsBlocksView(dashboardCategory: self.appDashboard.appDashboardGrids)
                        }
                    }   
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
