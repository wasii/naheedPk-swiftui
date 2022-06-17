//
//  SearchBarView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchTextFieldValue: String
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.leading, 15)
                TextField("Search....", text: $searchTextFieldValue) {
                    
                }
                .padding(.leading, -5)
                .padding(.trailing, -10)
                .padding(.top, 0)
                .padding(.bottom, 0)
            }
            .frame(height: 45)
            .background(.white)
            .cornerRadius(25)
        }
        .padding()
        .background(Color("NativeBlueColor"))
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchTextFieldValue: "").previewLayout(.sizeThatFits)
    }
}
