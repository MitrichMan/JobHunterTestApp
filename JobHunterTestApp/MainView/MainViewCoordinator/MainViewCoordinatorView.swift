//
//  MainViewCoordinatorView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 03.04.2024.
//

import SwiftUI

struct MainViewCoordinatorView: View {
    @StateObject private var mainViewCoordinator = MainViewCoordinator()

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            NavigationStack(path: $mainViewCoordinator.mainViewCoordinatorPath) {
                mainViewCoordinator.build(page: .signIn)
                    .environmentObject(mainViewCoordinator)
                    .navigationDestination(for: Page.self) { page in
                        mainViewCoordinator.build(page: page)
                            .environmentObject(mainViewCoordinator)
                    }
            }
            .environmentObject(mainViewCoordinator)
        }
// TODO: - fetch real data mhen API is fixed
        .task {
            if !DataManager.shared.isDataFetched {
//            await DataManager.shared.fetchMainViewData()
                if DataManager.shared.isLoggedIn {
                    await DataManager.shared.fetchMockData()
                }
            }
        }
    }
}

#Preview {
    MainViewCoordinatorView()
}
