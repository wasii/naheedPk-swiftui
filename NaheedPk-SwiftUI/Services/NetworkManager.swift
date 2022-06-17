//
//  NetworkManager.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import UIKit

enum APIError: Error {
    case DecodingError
    case NoData
}
enum RequestType: String {
    case get    = "GET"
    case post   = "POST"
}

class NetworkManager: NSObject {
    let aPICalling:      APICalling
    let responseHandler: ResponseHandler
    
    init(aPICalling: APICalling = APICalling(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.responseHandler = responseHandler
        self.aPICalling = aPICalling
    }
    
    func fetchData<T: Codable>(url: String, requesttype: RequestType, type: T.Type, params: [String:Any]?, token: String?, onCompletion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        self.aPICalling.callServer(url: url, requesttype: requesttype, params: params, token: token) { result in
            switch result {
            case .success(let data):
                self.responseHandler.handleResponse(type: type, data: data) { decoded in
                    switch decoded {
                    case .success(let model):
                        onCompletion(.success(model))
                    case .failure(_):
                        onCompletion(.failure(.DecodingError))
                    }
                }
                break
            case .failure(_):
                onCompletion(.failure(.NoData))
            }
        }
    }
}

class APICalling {
    func callServer(url: URL, requesttype:RequestType, params: [String:Any]?, token: String?, onCompletion: @escaping(Result<Data, APIError>) -> Void) {
        var request = URLRequest(url: url)
        switch requesttype {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        if params != nil {
            if let httpBody = try? JSONSerialization.data(withJSONObject: params ?? [:], options: []) {
                request.httpBody = httpBody
            }
        }
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.setValue("okhttp", forHTTPHeaderField: "User-Agent")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                return onCompletion(.failure(.NoData))
            }
            onCompletion(.success(data))
        }.resume()
    }
}

class ResponseHandler {
    func handleResponse<T:Codable>(type: T.Type, data: Data, onCompletion: @escaping(Result<T, APIError>) -> Void) {
        
        if let response = try? JSONDecoder().decode(type.self, from: data) {
            return onCompletion(.success(response))
        } else {
            return onCompletion(.failure(.DecodingError))
        }
    }
}
