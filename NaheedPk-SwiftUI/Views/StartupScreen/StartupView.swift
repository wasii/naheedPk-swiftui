//
//  StartupView.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import SwiftUI

struct StartupView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack {
            if self.isActive {
                ContentView()
                    .transition(.slide)
            } else {
                Color("NativeBlueColor")
                    .ignoresSafeArea(.all)
                    .overlay(
                        VStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 20)
                        }
                    )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
