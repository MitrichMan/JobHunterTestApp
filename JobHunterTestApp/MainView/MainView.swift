//
//  MainView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
//        if viewModel.isLoggedIn {
            ZStack {
                Color.black.ignoresSafeArea()
                
                Text("Main")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
            }
            .navigationBarBackButtonHidden()
//        } else { SignInView(isLoggedIn: $viewModel.isLoggedIn) }
    }
}

#Preview {
    MainView()
}
