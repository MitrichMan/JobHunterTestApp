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
        case .main:
            MainView()
        case .favourites:
            FavouritesView()
        case .responses:
            ResponsesView()
        case .messages:
            MessagesView()
        case .profile:
            ProfileView()
        case .vacancyList:
            VacancyListView(vacancies: dataManager.mockMainViewDataResponse.vacancies)
        case .vacancy:
            VacancyView()
        }
    }
}

enum Page: String {
    case signIn
    case main = "Поиск"
    case favourites = "Избранное"
    case responses = "Отклики"
    case messages = "Сообщения"
    case profile = "Профиль"
    case vacancyList = "По соответствию"
    case vacancy = "Страница вакансии"
}
