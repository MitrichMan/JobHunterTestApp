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
                .frame(height: 1.3)
                .foregroundStyle(.gray)
            
            HStack {
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
                        Image(.searchDefault)
                            .frame(width: 24, height: 24)
                            .padding(.horizontal)
                        Text(tab.rawValue)
                            .font(.system(size: 11))
                    }
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
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
