//
//  StartupScreenViewModel.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import RealmSwift
import UIKit

class StartupScreenViewModel: BaseViewModel {
    var realmServices = RealmServices()
    @Published var token: String = ""
    
    override init() {
        super.init()
        
        
        isTokenAvailable()
    }
    fileprivate func isTokenAvailable() {
        let token = realmServices.getToken()
        if token == "" {
            getToken()
        } else {
            self.token = token
        }
    }
    fileprivate func getToken() {
        NetworkManager().fetchData(url: APIConstant.GETGUESTTOKEN, requesttype: .post, type: String.self, params: nil, token: nil) { result in
            switch result {
            case .success(let token):
                DispatchQueue.main.async {
                    self.token = token
                    self.realmServices.addToken(token: token)
                }
                break
            case .failure(.DecodingError):
                break
            case .failure(.NoData):
                break
            }
        }
    }
}

class BearerToken: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var token = ""
}
