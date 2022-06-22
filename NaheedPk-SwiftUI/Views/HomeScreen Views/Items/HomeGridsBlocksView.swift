//
//  HomeGridsBlocksView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 22/06/2022.
//

import SwiftUI

struct HomeGridsBlocksView: View {
    var dashboardCategory: DashboardCategories
    var body: some View {
        VStack {
            if dashboardCategory.type == "product_grid" {
                GridParentView()
//                dashboardCategory.data.products
            } else {
                BlocksView()
            }
        }
//        ForEach(AppDashboardGridJSON, id: \.self) { grid in
//            if grid.type == "product_grid" {
//                GridParentView()
//            } else {
//                BlocksView()
//            }
//        }
    }
}

//struct HomeGridsBlocksView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeGridsBlocksView()
//            .previewLayout(.sizeThatFits)
//    }
//}
