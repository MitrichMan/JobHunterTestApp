//
//  MainViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 21.03.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var isDataFetched = false
    
    var dataManager = DataManager.shared
    
    var isLoggedIn = false
    
    var mainViewData = MainViewDataResponse(offers: [], vacancies: []) {
        didSet {
            offers = mainViewData.offers
            vacancies = mainViewData.vacancies
        }
    }
    var offers: [Offer] = []
    var vacancies: [Vacancy] = []
    
    @MainActor func fetchMainViewData() async {
        do {
            mainViewData = try await NetworkManager.shared.fetchMainViewDataResponse()
            isDataFetched = true
        } catch {
            print(error)
        }
    }
    
    func fetchMockData() async {
        mainViewData = dataManager.mockMainViewDataResponse
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        DispatchQueue.main.async {
            self.isDataFetched = true
        }
    }
    
    func setAvatarForOfferCell(with index: Int) -> Image {
        switch offers[index].id {
        case "near_vacancies":
            Image(.vacanciesDefault)
        case "level_up_resume":
            Image(.smallStarDefault)
        case "temporary_job":
            Image(.vacancies2Default)
        default:
            Image(.bigCloseDefault)
        }
    }
    
    func getCircleColor(with index: Int) -> [Color] {
        switch offers[index].id {
        case "near_vacancies":
            [Color.darkBlue, Color.blue1]
        case "level_up_resume":
            [Color.darkGreen, Color.green1]
        case "temporary_job":
            [Color.darkGreen, Color.green1]
        default:
            [Color.gray2, Color.gray3]
        }
    }
}


