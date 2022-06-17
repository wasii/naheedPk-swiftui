//
//  BaseViewModel.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}

class BaseViewModel: ObservableObject {
    @Published var loadingStates: LoadingState = .none
}
