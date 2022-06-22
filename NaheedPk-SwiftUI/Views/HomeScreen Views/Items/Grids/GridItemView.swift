//
//  GridItemView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct GridItemView: View {
    var product: CategoryProduct?
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .center) {
                Image("grid-1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:.infinity, maxHeight: .infinity)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Dawlance Cooking Series Microwave Oven, 30 Liters, DW-131 HP")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                Text("Rs. 26,500.00")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Rs. 29,500.00")
                    .font(.footnote)
                    .fontWeight(.light)
                    .background(
                        Color.gray
                            .frame(height:1)
                    )
                HStack(spacing: 5) {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.footnote)
                            .foregroundColor(Color.yellow)
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
                VStack {
                    Image("percentage-bg")
                        .resizable()
                        .frame(width: 30, height:20)
                    .padding(.top, 10)
                    Spacer()
                }
                Spacer()
                VStack {
                    Image("Krachi-only")
                        .resizable()
                        .frame(width: 40, height: 40)
                    .padding(.top, 10)
                    Spacer()
                }
            }
        )
        .frame(minWidth: 170, maxWidth: UIScreen.main.bounds.width / 2, minHeight: 150, maxHeight: .infinity)
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView()
            .previewLayout(.sizeThatFits)
    }
}
