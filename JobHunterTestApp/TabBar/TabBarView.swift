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
    
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray1)
            
            HStack() {
                ForEach(DataManager.shared.tabBarTabs, id: \.self) { tab in
                    
                    Button
                    {
                        
                        if viewModel.dataManager.isLoggedIn {
                            coordinator.presentedPage = viewModel.getPage(from: tab)
                            coordinator.push(coordinator.presentedPage)
                            
                        } else { return }
                    }
                label: {
                    VStack {
                            ZStack {
                            viewModel.getImage(for: tab)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.horizontal)
                            
                                if tab == .favourites && viewModel.getFavorites().count != 0 {
                                ZStack {
                                    Image(.notificationSticker)
                                        .foregroundStyle(.red)

                                    Text(viewModel.getFavorites().count.formatted())
                                        .font(.system(size: 8, weight: .bold))
                                        .foregroundStyle(.white)
                                        .offset(CGSize(width: 7.9, height: -6))
                                }
                            }
                        }
                        
                        Text(viewModel.getTabName(for: tab))
                            .font(.system(size: 10))
                    }
                    .padding(.horizontal, 8)
                    .foregroundStyle(
                        viewModel.getcolor(
                            if: tab,
                            matches: viewModel.getTab(from: coordinator.presentedPage)
                        )
                    )
                }
                .disabled(viewModel.getTab(from: coordinator.presentedPage) == tab ? true : false)
                }
                .disabled(!viewModel.dataManager.isLoggedIn)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
