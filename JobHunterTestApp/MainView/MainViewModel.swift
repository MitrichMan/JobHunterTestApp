//
//  MainViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 21.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var dataManager = DataManager.shared
    
    @Published var isLoggedIn = false {
        didSet {
            dataManager.isLoggedIn = isLoggedIn
        }
    }
    
    @Published var isDataFetched = false
    
    var mainViewData = MainViewDataResponse(offers: [], vacancies: [])
    
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
        
        isDataFetched = true
    }
}
