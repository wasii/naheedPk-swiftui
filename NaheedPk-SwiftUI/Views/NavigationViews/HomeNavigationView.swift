//
//  HomeNavigationView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct HomeNavigationView: View {
    @State var itemCounts: Int = 10
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                    .foregroundColor(.white)
            }
            HStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 35, alignment: .trailing)
            }
            Spacer()
            Button(action: {}) {
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
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .font(.custom("", size: 25))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(90))
            }
        }
        .padding()
        .background(Color("NativeBlueColor"))
    }
}

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
            .previewLayout(.sizeThatFits)
    }
}
