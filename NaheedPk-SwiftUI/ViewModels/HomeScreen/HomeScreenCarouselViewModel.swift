//
//  HomeScreenCarouselViewModel.swift
//  NaheedPk-SwiftUI
//
//  Created by NaheedPK on 17/06/2022.
//

import Foundation
import SwiftyJSON

class HomeScreenCarouselViewModel: BaseViewModel {
    @Published var appSliders: [AppSliders] = []
    @Published var appCategories: [AppCategories] = []
    private var token: String = ""
    let networkManager = NetworkManager()
    
    override init() {
        super.init()
        let realmServices = RealmServices()
        self.token = realmServices.getToken()
        self.getServerData()
    }
    func getServerData() {
        networkManager.fetchData(url: APIConstant.APPDASHBOARD, requesttype: .get, type: [AppDashboard].self, params: nil, token: self.token) { result in
            switch result {
            case .success(let dashboard):
                dashboard.forEach { dashboard in
                    if let sliderJson = JSON(dashboard.sliders).array {
                        var final_slider = [AppSliders]()
                        sliderJson.forEach { slider in
                            do {
                                let rawData = try slider.rawData()
                                let current_slider = try JSONDecoder().decode(AppSliders.self, from: rawData)
                                final_slider.append(current_slider)
                            } catch let err {
                                print(err.localizedDescription)
                            }
                        }
                        self.appSliders = final_slider
                    }
                }
                break
            case .failure(.NoData):
                break
            case .failure(.DecodingError):
                break
            }
        }
    }
}


