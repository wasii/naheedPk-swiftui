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
            getGuestToken { token in
                DispatchQueue.main.async {
                    if let token = token {
                        self.token = token
                        self.realmServices.addToken(token: token)
                    }
                }
            }
        } else {
            self.token = token
        }
    }
}

class BearerToken: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var token = ""
}
