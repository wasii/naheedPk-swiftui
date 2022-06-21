//
//  HomeScreenCarousel.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI
import URLImage

struct HomeScreenCarousel: View {
//    var appSlider: [AppSliders]
    var body: some View {
        TabView {
            ForEach(AppSliderJSON, id: \.self) { slider in
                CarouselView(carousel: slider)
                    .onTapGesture {
                        debugPrint(slider.link_type)
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct HomeScreenCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCarousel()
//            .previewDevice("iPhone 12 Pro")
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
    }
}
