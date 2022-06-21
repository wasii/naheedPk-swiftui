//
//  CarouselView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 18/06/2022.
//

import SwiftUI

struct CarouselView: View {
    let carousel: AppSliders
    var body: some View {
        Image(carousel.image)
            .resizable()
            .frame(height: UIScreen.main.bounds.width / 1.8)
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
