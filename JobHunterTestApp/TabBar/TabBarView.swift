//
//  TabBarView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = TabBarViewModel()
    
    @ObservedObject var dataManager = DataManager.shared
    
    var body: some View {
        VStack {
            Rectangle()
                .ignoresSafeArea()
                .frame(height: 1)
                .foregroundStyle(.gray1)
            
            HStack(spacing: 16) {
                ForEach(dataManager.tabBarTabs, id: \.self) { tab in
                    
                    Button
                    {
                        if dataManager.isLoggedIn {
                            coordinator.presentedTab = tab
                            coordinator.push(coordinator.presentedTab)
                        } else { return }
                    }
                label: {
                    VStack {
                        ZStack {
                            viewModel.getImage(for: tab)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.horizontal)
                            
                            if tab == .favourites([]) && viewModel.getFavorites().count != 0 {
                                ZStack {
                                    Image(.notificationSticker)
                                        .foregroundStyle(.red)
                                    
                                    Text(viewModel.getFavorites().count.formatted())
                                        .font(.system(size: 8, weight: .bold))
                                        .foregroundStyle(.white)
                                        .offset(CGSize(width: 7.2, height: -5))
                                }
                            }
                        }
                        
                        Text(viewModel.getTabName(for: tab))
                            .font(.system(size: 10))
                            .layoutPriority(1)
                    }
                    .foregroundStyle(
                        viewModel.getcolor(
                            if: tab,
                            matches: coordinator.presentedTab
                        )
                    )
                    
                }
                .disabled(coordinator.presentedTab == tab)
                }
                .disabled(!dataManager.isLoggedIn)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
