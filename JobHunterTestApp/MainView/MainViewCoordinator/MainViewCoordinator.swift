//
//  MainViewCoordinator.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 03.04.2024.
//

import SwiftUI

@MainActor class MainViewCoordinator: ObservableObject {
//    @Published var mainViewCoordinatorPath = NavigationPath()
//    @Published var presentedPage: Page = .main(DataManager.shared.mainViewData)
    
    @Published var mainViewCoordinatorPath: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savedPath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savedPath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                mainViewCoordinatorPath = NavigationPath(decoded)
                return
            }
        }
        mainViewCoordinatorPath = NavigationPath()
    }
    
    func save() {
        guard let representation = mainViewCoordinatorPath.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savedPath)
        } catch {
            print("Failed to save navigation data")
        }
    }

    func push(_ page: Page) {
        print("MaiCoord before push \(mainViewCoordinatorPath)")
        mainViewCoordinatorPath.append(page)
        save()
        print("MaiCoord after push \(mainViewCoordinatorPath)")
    }
    
    func pop() {
        print("MaiCoord before pop \(mainViewCoordinatorPath)")
        mainViewCoordinatorPath.removeLast()
        save()
        print("MaiCoord after pop \(mainViewCoordinatorPath)")
    }
    
    func popToRoot() {
        print("MaiCoord before popToRoot \(mainViewCoordinatorPath)")
        mainViewCoordinatorPath.removeLast(mainViewCoordinatorPath.count)
        save()
        print("MaiCoord after popToRoot \(mainViewCoordinatorPath)")
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
