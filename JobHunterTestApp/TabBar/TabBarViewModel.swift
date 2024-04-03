//
//  TabBarViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @ObservedObject var dataManager = DataManager.shared
    
    @Published var foregroundColor = Color.gray
        
    func getcolor(if tab: Tab, matches selectedTab: Tab) -> Color {
        if tab == selectedTab {
            return Color.blue
        } else {
            return Color.gray
        }
    }
    
    func getImage(for tab: Tab) -> Image {
        switch tab {
        case .mainViewCoordinator:
            Image(.searchDefault)
        case .favourites:
            Image(.heartDefault)
        case .responses:
            Image(.responsesDefault)
        case .messages:
            Image(.messagesDefault)
        case .profile:
            Image(.profileDefault)
        }
    }
    
    func getFavorites() -> [Vacancy] {
        dataManager.mainViewData.vacancies.filter { vacancy in
            vacancy.isFavorite
        }
    }
    
    func getTabName(for page: Tab) -> String {
        switch page {
        case .mainViewCoordinator:
            "Поиск"
        case .favourites:
            "Избранное"
        case .responses:
            "Отклики"
        case .messages:
            "Сообщения"
        case .profile:
            "Профиль"
        }
    }
}
