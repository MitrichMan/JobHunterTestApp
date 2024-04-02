//
//  Coordinator.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

@MainActor class Coordinator: ObservableObject {
    @Published var dataManager = DataManager.shared
    @Published var path = NavigationPath()
    
    @Published var presentedPage: Page = .main(DataManager.shared.mainViewData)
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder func build(page: Page) -> some View {
        switch page {
        case .signIn:
            SignInView()
        case let .main(mainViewDataResponse):
            MainView(mainViewDataResponse: mainViewDataResponse)
        case let .favourites(favourites):
            FavouritesView(favourites: favourites)
        case .responses:
            ResponsesView()
        case .messages:
            MessagesView()
        case .profile:
            ProfileView()
        }
    }
}
