//
//  HomeNavigationView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct HomeNavigationView: View {
    @State var itemCounts: Int = 0
    var body: some View {
        HStack {
            Button(action: {
                debugPrint("Side Menu Btn Tapped")
            }) {
                Image("menu")
                    .font(.title)
                    .foregroundColor(.white)
            }
            HStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 35, alignment: .trailing)
                    .padding(.leading, 10)
            }
            Spacer()
            Button(action: {
                debugPrint("Cart Btn Tapped")
            }) {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(.white)
                    Circle()
                        .fill(.red)
                        .frame(width:20, height:20, alignment: .center)
                        .offset(x: 13, y: -10)
                    Text("\(itemCounts)")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .offset(x: 13, y: -10)
                }
            }
            Button(action: {
                debugPrint("Menu Btn Tapped")
            }) {
                Image(systemName: "ellipsis")
                    .font(.custom("", size: 25))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(90))
            }
        }
        .padding()
        .padding(.bottom, -12)
        .background(Color(NativeBlueColor))
    }
}

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
            .previewLayout(.sizeThatFits)
    }
}
