//
//  ProfileView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Text("Profile")
                .font(.system(size: 40))
                .foregroundStyle(.white)
        }
        .navigationBarBackButtonHidden()    }
}

#Preview {
    ProfileView()
}
