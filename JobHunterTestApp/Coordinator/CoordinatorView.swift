//
//  CoordinatorView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct CoordinatorView: View {
//    @StateObject private var coordinator = Coordinator()


    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
//            VStack {
//                NavigationStack(path: $coordinator.path) {
//                    coordinator.build(tab: coordinator.presentedTab)
//                        .navigationDestination(for: Tab.self) { tab in
//                            coordinator.build(tab: tab)
//                        }
//                }
//                .environmentObject(coordinator)
//                .layoutPriority(1)
                
                TabBarView()
//                    .environmentObject(coordinator)
            }
//        }
        
//        // TODO: - fetch real data mhen API is fixed
//        .task {
//            if !DataManager.shared.isDataFetched {
////            await DataManager.shared.fetchMainViewData()
//                await DataManager.shared.fetchMockData()
//            }
//        }
    }
}

#Preview {
    CoordinatorView()
}
