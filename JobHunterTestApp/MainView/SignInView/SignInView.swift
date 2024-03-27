//
//  SignInView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = SignInViewModel()
    
    @State private var presented = false
    
    @State var text = ""
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if !viewModel.dataManager.isLoggedIn {
                VStack {
                    HStack {
                        Text("Вход в личный кабинет")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    ZStack {
                        Color.gray1
                        
                        VStack {
                            HStack {
                                Text("Поиск работы")
                                    .font(.system(size: 19))
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            
                            ZStack {
                                Color(.gray2)
                                    .frame(height: 40)
                                    .cornerRadius(8)
                                
                                HStack(spacing: 8) {
                                    Image(.responsesDefault)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.gray4)
                                    
                                    Text("Электронная почта или телефон")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray4)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 8)
                                
                                TextField("", text: $text)
                            }
                            
                            HStack {
                                Button {
                                    if DataManager.shared.emailIsValid {
                                    // coordinator.push(.verification)
                                        presented.toggle()
                                    }
                                } label: {
                                    ZStack {
                                        if DataManager.shared.emailIsValid {
                                            Color.blue1
                                                .cornerRadius(8)
                                                .frame(height: 48)
                                        } else { 
                                            Color.darkBlue
                                                .cornerRadius(8)
                                                .frame(height: 48)
                                        }
                                        
                                        HStack {
                                            Spacer()
                                            
                                            Text("Продолжить")
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundStyle(
                                                    DataManager.shared.emailIsValid ? .white : .gray4
                                                )
                                            
                                            Spacer()
                                        }
                                    }
                                }
//                                .buttonStyle(.borderedProminent)
                                .sheet(isPresented: $presented) {
                                    VerificationCodeView(presented: $presented)
                                }
                                
                                Button {} label: {
                                    Text("Войти с паролем")
                                }
                                
                            }
                        }
                        .padding()
                        .layoutPriority(1)
                    }
                    .cornerRadius(12)
                    .padding()
                    
                    ZStack(alignment: .leading) {
                        Color.gray1
                        
                        VStack(alignment: .leading) {
                            Text("Поиск сотрудников")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.white)
                            
                            
                            Text("Размещение вакансий и доступ к базе резюме")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                            
                            Button {} label: {
                                ZStack {
                                    Capsule()
                                        .foregroundStyle(.green1)
                                    Text("Я ищу сотрудников")
                                        .foregroundStyle(.white)
                                }
                                .frame(height: 35)
                            }
                            
                        }
                        .padding()
                        .layoutPriority(1)
                    }
                    .cornerRadius(12)
                    .padding()
                    
                    Spacer()
                }
            } else {
                MainView()
            }
        }
    }
}

#Preview {
    //    SignInView()
    CoordinatorView()
}
