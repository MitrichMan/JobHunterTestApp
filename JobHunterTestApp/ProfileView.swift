//
//  ProfileView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                
                Button {
                    DataManager.shared.isLoggedIn = false
                    coordinator.presentedPage = .main(DataManager.shared.mainViewData)
                    coordinator.popToRoot()
                } label: {
                    HStack {
                        Spacer()
                        
                        Text("Log out")
                        
                        Spacer()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProfileView()
}
