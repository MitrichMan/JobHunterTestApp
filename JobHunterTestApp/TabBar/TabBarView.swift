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
            
            HStack(/*spacing: 20*/) {
                ForEach(viewModel.dataManager.tabBarTabs, id: \.self) { tab in
                    
                    Button
                    {
                        
                        if viewModel.dataManager.isLoggedIn {
                            viewModel.dataManager.presentedTab = tab
                            coordinator.push(viewModel.dataManager.presentedTab)
                            
                        } else { return }
                    }
                label: {
                    VStack {
// TODO: - make sticker logic
//                        ZStack {
                        viewModel.getImage(for: tab)
                            .resizable()
                            .frame(width: 26, height: 26)
                            .padding(.horizontal)
                        
//                            ZStack {
//                                Image(.notificationSticker)
//                                    .foregroundStyle(.red)
//
//                                Text("4")
//                                    .font(.system(size: 8, weight: .bold))
//                                    .foregroundStyle(.white)
//                                    .offset(CGSize(width: 7.9, height: -6))
//                            }
//                        }
                        
                        Text(tab.rawValue)
                            .font(.system(size: 10))
                    }
                    .padding(.horizontal, 8)
                    .foregroundStyle(
                        viewModel.getcolor(
                            if: tab,
                            matches: viewModel.dataManager.presentedTab
                        )
                    )
                }
                .disabled(viewModel.dataManager.presentedTab == tab ? true : false)
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
