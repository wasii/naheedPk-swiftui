//
//  DashboardGrids.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import Foundation
// MARK: - WelcomeElement
struct DashboardCategories: Codable {
    let type: String
    let data: CategoryDataClass
}

// MARK: - DataClass
struct CategoryDataClass: Codable {
    let gridTitle: String?
    let background: String?
    let viewLinkType, viewLink: String?
    let products: [CategoryProduct]?
    let reviewAvailable, title: String?
    let rows: [CategoryRow]?
    
    enum CodingKeys: String, CodingKey {
        case gridTitle = "grid_title"
        case background
        case viewLinkType = "view_link_type"
        case viewLink = "view_link"
        case products
        case reviewAvailable = "review_available"
        case title, rows
    }
}

// MARK: - Product
struct CategoryProduct: Codable, Hashable {
    let id, sku, name, price: String
    let finalPrice: String
    let discount: Bool
    let discountPercent: Int
    let karachiOnly: Bool
    let cityIcon: String
    let countryFlag: String
    let image, imageMedium: String
    let reviewsSummary: String
    let reviewsCount: String?
    let discountHeight, reviewsHeight: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, sku, name, price
        case finalPrice = "final_price"
        case discount
        case discountPercent = "discount_percent"
        case karachiOnly = "karachi_only"
        case cityIcon = "city_icon"
        case countryFlag = "country_flag"
        case image
        case imageMedium = "image_medium"
        case reviewsSummary = "reviews_summary"
        case reviewsCount = "reviews_count"
        case discountHeight = "discount_height"
        case reviewsHeight = "reviews_height"
    }
}

// MARK: - Row
struct CategoryRow: Codable {
    let columns: String
    let images: [CategoryImage]
}

// MARK: - Image
struct CategoryImage: Codable, Hashable {
    let image: String
    let linkType, linkValue: String
    
    enum CodingKeys: String, CodingKey {
        case image
        case linkType = "link_type"
        case linkValue = "link_value"
    }
}
