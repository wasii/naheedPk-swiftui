//
//  AppSlider.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation

// MARK: - Slider
struct AppSliders: Codable, Hashable {
    var image: String
    var link_type, link: String?
    
    enum CodingKeys: String, CodingKey {
        case image
        case link_type
        case link
    }
}

// MARK: - Category
struct AppCategories: Codable, Hashable {
    var title: String
    var image: String
    var category: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case title, image, category, url
    }
}


struct AppDashboard: Codable {
    let androidVersion, androidForceUpdate, androidURL, iosVersion: String
    let iosForceUpdate: String
    let iosURL: String?
    let sliders: [AppSliders]
    let categories: [AppCategories]
    let templatePageLimit: Int
    let template: [AppTemplate]
    
    enum CodingKeys: String, CodingKey {
        case androidVersion = "android_version"
        case androidForceUpdate = "android_force_update"
        case androidURL = "android_url"
        case iosVersion = "ios_version"
        case iosForceUpdate = "ios_force_update"
        case iosURL = "ios_url"
        case sliders, categories
        case templatePageLimit = "template_page_limit"
        case template
    }
}

// MARK: - Template
struct AppTemplate: Codable {
    let rowType: RowType
    let rowValue: String
    
    enum CodingKeys: String, CodingKey {
        case rowType = "row_type"
        case rowValue = "row_value"
    }
}

enum RowType: String, Codable {
    case imageBlock = "image_block"
    case productGrid = "product_grid"
}
