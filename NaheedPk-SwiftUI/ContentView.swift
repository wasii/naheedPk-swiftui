//
//  ContentView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                HomeNavigationView()
                SearchBarView(searchTextFieldValue: "")
                Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
