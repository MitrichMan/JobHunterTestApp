//
//  TabBarViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    
    @Published var dataManager = DataManager.shared
    @Published var foregroundColor = Color.gray
        
    func getcolor(if tab: TabBarTab, matches selectedTab: TabBarTab) -> Color {
        if tab == selectedTab {
            return Color.blue
        } else {
            return Color.gray
        }
    }
    
    func getImage(for tab: TabBarTab) -> Image {
        switch tab {
        case .main:
            Image(.searchDefault)
        case .favourites:
            Image(.heartDefault)
        case .responses:
            Image(.responsesDefault)
        case .messages:
            Image(.messagesDefault)
        case .profile:
            Image(.profileDefault)
        case .signIn:
            Image(.bigCloseDefault)
        }
    }
    
    
    func getFavorites() -> [Vacancy] {
        DataManager.shared.mainViewData.vacancies.filter { vacancy in
            vacancy.isFavorite
        }
    }
    
    func getTabName(for page: TabBarTab) -> String{
        switch page {
        case .main:
            "Поиск"
        case .favourites:
            "Избранное"
        case .responses:
            "Отклики"
        case .messages:
            "Сообщения"
        case .profile:
            "Профиль"
        case .signIn:
            ""
        }
    }
    
    func getTab(from page: Page) -> TabBarTab {
        switch page {
        case .main:
                .main
        case .favourites:
                .favourites
        case .responses:
                .responses
        case .messages:
                .messages
        case .profile:
                .profile
        default:
                .signIn
        }
    }
        
    func getPage(from tab: TabBarTab) -> Page {
        switch tab {
        case .main:
                .main(dataManager.mainViewData)
        case .favourites:
                .favourites(getFavorites())
        case .responses:
                .responses
        case .messages:
                .messages
        case .profile:
                .profile
        case .signIn:
                .signIn
        }
    }
}
