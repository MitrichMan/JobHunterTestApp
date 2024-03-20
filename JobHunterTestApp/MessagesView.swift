//
//  MessagesView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Text("Messages")
                .font(.system(size: 40))
                .foregroundStyle(.white)
        }
        .navigationBarBackButtonHidden()    }
}

#Preview {
    MessagesView()
}
