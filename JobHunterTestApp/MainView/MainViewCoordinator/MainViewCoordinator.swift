//
//  MainViewCoordinator.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 03.04.2024.
//

import SwiftUI

@MainActor class MainViewCoordinator: ObservableObject {
    @Published var MainViewCoordinatorPath = NavigationPath()
    
    func push(_ page: Page) {
        print("MaiCoord before push \(MainViewCoordinatorPath)")
        MainViewCoordinatorPath.append(page)
        print("MaiCoord after push \(MainViewCoordinatorPath)")
    }
    
    func pop() {
        print("MaiCoord before pop \(MainViewCoordinatorPath)")
        MainViewCoordinatorPath.removeLast()
        print("MaiCoord after pop \(MainViewCoordinatorPath)")
    }
    
    func popToRoot() {
        print("MaiCoord before popToRoot \(MainViewCoordinatorPath)")
        MainViewCoordinatorPath.removeLast(MainViewCoordinatorPath.count)
        print("MaiCoord after popToRoot \(MainViewCoordinatorPath)")
    }
    
    @ViewBuilder func build(page: Page) -> some View {
        switch page {
        case .signIn:
            SignInView()
        case let .main(mainViewDataResponse):
            MainView(mainViewDataResponse: mainViewDataResponse)
        case let .vacancyList(vacancies):
            VacancyListView(vacancies: vacancies)
        case let .vacancy(vacancy):
            VacancyView(vacancy: vacancy)
        }
    }
}
