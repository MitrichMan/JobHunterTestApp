//
//  VerificationCodeView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @Binding var presented: Bool

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Отправили код на example@mail.ru")
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                
                Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                
                HStack {
                    ForEach(0...3, id: \.self) { index in
                        TextField("*", text: .constant(""))
                            .frame(width: 48, height:  48)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                
                Button {
                    DataManager.shared.isLoggedIn = true
                    DataManager.shared.presentedTab = .main
                    presented = false
                    coordinator.push(DataManager.shared.presentedTab)
                } label: {
                    HStack {
                        Spacer()
                        
                        Text("Продолжить")
                        
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
    VerificationCodeView(presented: .constant(true))
}
