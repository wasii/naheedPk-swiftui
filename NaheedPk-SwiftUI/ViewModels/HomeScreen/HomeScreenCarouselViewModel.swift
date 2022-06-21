//
//  HomeScreenCarouselViewModel.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import SwiftyJSON

class HomeScreenDashboardViewModel: BaseViewModel {
    @Published var appSliders = [AppSliders]()
    @Published var appCategories = [AppCategories]()
    private var token: String = ""
    let networkManager = NetworkManager()
    
    override init() {
        super.init()
        let realmServices = RealmServices()
        self.token = realmServices.getToken()
//        self.getServerData()
    }
    func getServerData() {
        networkManager.fetchData(url: APIConstant.APPDASHBOARD, requesttype: .get, type: [AppDashboard].self, params: nil, token: self.token) { result in
            switch result {
            case .success(let dashboard):
                print(dashboard)
                if let sliderJson = dashboard.first?.sliders {
                    DispatchQueue.main.async {
                        self.appSliders = sliderJson
                    }
                    
                }
                if let categories = dashboard.first?.categories {
                    DispatchQueue.main.async {
                        self.appCategories = categories
                    }
                    
                }
//                dashboard.forEach { dashboard in
//                    if let sliderJson = JSON(dashboard.sliders).array {
//                    }
//                }
                break
            case .failure(.NoData):
                break
            case .failure(.DecodingError):
                break
            }
        }
    }
}


