//
//  File.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import SwiftUI

///DATA
let AppDashboardJSON:       [AppDashboard] = Bundle.main.decode("appdashboard.json")
let AppSliderJSON:          [AppSliders] = Bundle.main.decode("app_slider.json")
let AppCategoriesJSON:      [AppCategories] = Bundle.main.decode("app_category.json")
//let AppDashboardGridJSON:   [DashboardCategories] = Bundle.main.decode("appdashboard_grid.json")

///COLOR
let NativeBlueColor = "NativeBlueColor"



///Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 4)
}
