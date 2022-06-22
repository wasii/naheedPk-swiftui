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
    var realm: RealmServices?
    func getGuestToken(_ handler: @escaping(String?)-> Void) {
        NetworkManager().fetchData(url: APIConstant.GETGUESTTOKEN, requesttype: .post, type: String.self, params: nil, token: nil) { result in
            switch result {
            case .success(let token):
                self.realm = RealmServices()
                let previousToken = self.realm?.getToken()
                self.realm?.updateToken(previousToken: previousToken ?? "", newToken: token)
                handler(token)
                break
            case .failure(.DecodingError):
                handler(nil)
                break
            case .failure(.NoData):
                handler(nil)
                break
            }
        }
    }
}
