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
    @Published var appDashboardGrids = [DashboardCategories]()
    private var token: String = ""
    let networkManager = NetworkManager()
    
    override init() {
        super.init()
        let realmServices = RealmServices()
        self.token = realmServices.getToken()
        self.getAppSliderCategories()
        self.getAppDashboard()
    }
    fileprivate func getAppSliderCategories() {
        self.loadingStates = .loading
        networkManager.fetchData(url: APIConstant.APPDASHBOARD, requesttype: .get, type: [AppDashboard].self, params: nil, token: self.token) { result in
            switch result {
            case .success(let dashboard):
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
                DispatchQueue.main.async {
                    self.loadingStates = .success
                }
                break
            case .failure(.NoData):
                break
            case .failure(.DecodingError):
                self.getGuestToken { token in
                    if let _ = token {
                        self.getAppSliderCategories()
                        return
                    }
                }
                debugPrint("Token Expired")
                break
            }
        }
    }
    
    private func getAppDashboard() {
        self.loadingStates = .loading
        networkManager.fetchData(url: APIConstant.APPDASHBOARDGRID + "1", requesttype: .get, type: [DashboardCategories].self, params: nil, token: self.token) { result in
            switch result {
            case .success(let grids):
                DispatchQueue.main.async {
                    self.appDashboardGrids.append(contentsOf: grids)
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


