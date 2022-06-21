//
//  GridItemView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 21/06/2022.
//

import SwiftUI

struct GridItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack {
                Image("grid-1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 225, maxHeight: 225)
            }
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
                        .foregroundColor(Color.yellow)
                }
            }
        }
        .border(.gray, width: 1)
        .cornerRadius(10)
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
        .padding()
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView()
            .previewLayout(.sizeThatFits)
    }
}
