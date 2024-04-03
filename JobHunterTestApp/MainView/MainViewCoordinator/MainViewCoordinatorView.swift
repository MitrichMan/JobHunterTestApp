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
            
            NavigationStack(path: $mainViewCoordinator.MainViewCoordinatorPath) {
                mainViewCoordinator.build(page: .signIn)
                    .environmentObject(mainViewCoordinator)
                    .navigationDestination(for: Page.self) { page in
                        mainViewCoordinator.build(page: page)
                            .environmentObject(mainViewCoordinator)
                    }
            }
            .environmentObject(mainViewCoordinator)
        }
    }
}

#Preview {
    MainViewCoordinatorView()
}
