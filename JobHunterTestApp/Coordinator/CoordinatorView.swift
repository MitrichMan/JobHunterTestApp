//
//  CoordinatorView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: DataManager.shared.presentedTab)
                        .navigationDestination(for: Page.self) { page in
                            coordinator.build(page: page)
                    }
                }
            .environmentObject(coordinator)
            .layoutPriority(1)
                
                TabBarView()
                    .environmentObject(coordinator)
            }
        }
        
        
    }
}

#Preview {
    CoordinatorView()
}
