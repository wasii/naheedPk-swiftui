//
//  GridItemView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct GridItemView: View {
    var product: CategoryProduct
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .center) {
                WebImage(url: URL(string: product.imageMedium)!)
                    .resizable()
                    .placeholder(Image(systemName: "1-category"))
                    .scaledToFit()
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                    .cornerRadius(10)
                //                Image("grid-1")
                //                    .resizable()
                //                    .scaledToFit()
                //                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                //                    .cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                Text(product.finalPrice)
                    .font(.footnote)
                    .fontWeight(.semibold)
                if product.discount {
                    Text("Rs. 29,500.00")
                        .font(.footnote)
                        .fontWeight(.light)
                        .background(
                            Color.gray
                                .frame(height:1)
                        )
                }
                
                if product.reviewsSummary != "0.0" {
                    let stringRating = product.reviewsSummary
                    let intRating = Int(stringRating) ?? 1
                    
                    HStack(spacing: 5) {
                        ForEach(1...5, id: \.self) { index in
                            let condition = index <= intRating
                            Image(systemName: condition ? "star.fill" : "star")
                                .font(.footnote)
                                .foregroundColor(Color.yellow)
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.5)
        )
        .overlay(
            HStack {
                if product.discount {
                    VStack {
                        ZStack {
                            Image("percentage-bg")
                                .resizable()
                                .frame(width: 40, height:35)
                                .padding(.top, 10)
                            Text("\(product.discountPercent)%\nOFF")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .padding(.top, 10)
                                .frame(width: 40, height:35)
                        }
                        Spacer()
                    }
                }
                Spacer()
                if product.karachiOnly {
                    VStack {
                        Image("Krachi-only")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.top, 10)
                        Spacer()
                    }
                }
            }
        )
        .frame(minWidth: 170, maxWidth: UIScreen.main.bounds.width / 2, minHeight: 150, maxHeight: .infinity)
    }
}

//struct GridItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridItemView()
//            .previewLayout(.sizeThatFits)
//    }
//}
