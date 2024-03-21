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
                    coordinator.popToRoot()
                    DataManager.shared.isLoggedIn = false
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
        .navigationBarBackButtonHidden()    }
}

#Preview {
    ProfileView()
}
