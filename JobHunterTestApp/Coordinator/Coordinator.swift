////
////  Coordinator.swift
////  JobHunterTestApp
////
////  Created by Dmitrii Melnikov on 20.03.2024.
////
//
//import SwiftUI
//
//@MainActor class Coordinator: ObservableObject {
//    
//    @Published var path = NavigationPath()
////    @Published var path = DataManager.shared.navigationPaths.tab
//    
//    @Published var presentedTab: Tab = .mainViewCoordinator
//    
//    func push(_ tab: Tab) {
//        print("TabCoord before push \(path)")
//        path.append(tab)
//        print("TabCoord after push \(path)")
//    }
//    
//    func pop() {
//        print("TabCoord before pop \(path)")
//        path.removeLast()
//        print("TabCoord after pop \(path)")
//    }
//    
//    func popToRoot() {
//        print("TabCoord before popToRoot \(path)")
//        path.removeLast(path.count)
//        print("TabCoord after popToRoot \(path)")
//    }
//    
//    @ViewBuilder func build(tab: Tab) -> some View {
//        switch tab {
//        case let .favourites(favourites):
//            FavouritesView(favourites: favourites)
//        case .responses:
//            ResponsesView()
//        case .messages:
//            MessagesView()
//        case .profile:
//            ProfileView()
//        case .mainViewCoordinator:
//            MainViewCoordinatorView()
//        }
//    }
//}
