//
//  MainView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Text("Main")
                .font(.system(size: 40))
                .foregroundStyle(.white)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
