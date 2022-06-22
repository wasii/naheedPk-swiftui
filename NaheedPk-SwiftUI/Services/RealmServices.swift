//
//  RealmServices.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import RealmSwift

class RealmServices: ObservableObject {
    private(set) var localRealm: Realm?

    
    init() {
        initialiseRealm()
    }
    
    private func initialiseRealm() {
        do {
            localRealm = try Realm()
            debugPrint(Realm.Configuration.defaultConfiguration.fileURL)
        } catch let err {
            debugPrint("Error opening realm: \(err.localizedDescription)")
        }
    }
    
    func addToken(token: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write({
                    let newToken = BearerToken(value: ["token" : token])
                    localRealm.add(newToken)
                    
                    print("token added successfully")
                })
            } catch let err {
                print("error while adding token: \(err.localizedDescription)")
            }
        }
    }
    func getToken() -> String {
        if let localRealm = localRealm {
            let token = localRealm.objects(BearerToken.self).sorted(byKeyPath: "token")
            if token.count > 0 {
                print("BearerToken: \(token[0].token)")
                return token[0].token
            }
        }
        return ""
    }
    
    func updateToken(previousToken: String, newToken: String) -> String {
        if let localRealm = localRealm {
            do {
                let tokenToUpdate = localRealm.objects(BearerToken.self).filter(NSPredicate(format: "token == %@", previousToken))
                guard !tokenToUpdate.isEmpty else { return "" }
                do {
                    try localRealm.write({
                        tokenToUpdate[0].token = newToken
                    })
                    return newToken
                } catch let err {
                    print("error while updaing error: \(err.localizedDescription)")
                }
            } catch let err {
                print("error while updating token: \(err.localizedDescription)")
            }
        }
        return ""
    }
}
