//
//  CarouselView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 18/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI
struct CarouselView: View {
    let carousel: AppSliders
    var body: some View {
        
        WebImage(url: URL(string: carousel.image))
            // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
//            .onSuccess { image, data, cacheType in }
            .resizable()
//            .placeholder(Image(systemName: "photo")) // Placeholder Image
            .indicator(.activity) // Activity Indicator
            .transition(.fade(duration: 0.5)) // Fade Transition with duration
            .scaledToFit()
            .frame(height: UIScreen.main.bounds.width / 1.8)
            
//        Image(carousel.image)
//            .resizable()
//            .frame(height: UIScreen.main.bounds.width / 1.8)
//            .cornerRadius(12)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(carousel: AppSliderJSON[1])
            .previewLayout(.sizeThatFits)
//            .padding()
//            .background()
    }
}
