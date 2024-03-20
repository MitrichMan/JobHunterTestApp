//
//  Coordinator.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

@MainActor class Coordinator: ObservableObject {
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
        VStack {
            switch page {
            case .signIn:
                SignInView()
            case .favourites:
                SignInView()
            }
            TabBarView()
                .frame(height: 54)
        }
    }
}

enum Page: String {
    case signIn
    case favourites
}
