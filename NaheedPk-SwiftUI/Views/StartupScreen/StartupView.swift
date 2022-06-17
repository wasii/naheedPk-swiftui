//
//  StartupView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI
import RealmSwift

struct StartupView: View {
    @ObservedObject private var startupViewModel: StartupScreenViewModel
    @State var isActive:Bool = false
    init() {
        self.startupViewModel = StartupScreenViewModel()
    }
    var body: some View {
        VStack {
            if self.startupViewModel.token == "" {
                Color(NativeBlueColor)
                    .ignoresSafeArea(.all)
                    .overlay(
                        VStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 20)
                        }
                    )
            } else {
                HomeScreen()
                    .transition(.slide)
            }
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
