//
//  HomeScreenCarousel.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct HomeScreenCarousel: View {
    @ObservedObject private var appSlider: HomeScreenCarouselViewModel
    var body: some View {
//        TabView {
//
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        Text("")
    }
}

struct HomeScreenCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCarousel()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
