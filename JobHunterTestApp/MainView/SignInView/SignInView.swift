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
                        Color.gray
                        
                        VStack {
                            HStack {
                                Text("Поиск работы")
                                    .font(.system(size: 19))
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            
                            TextField("Placeholder", text: $text)
                                .textFieldStyle(.roundedBorder)
                            
                            HStack {
                                Button {
                                    //                                    coordinator.push(.verification)
                                    presented.toggle()
                                } label: {
                                    HStack {
                                        Spacer()
                                        
                                        Text("Продолжить")
                                        
                                        Spacer()
                                    }
                                }
                                .sheet(isPresented: $presented) {
                                    VerificationCodeView(presented: $presented)
                                }
                                .buttonStyle(.borderedProminent)
                                
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
                        Color.gray
                        
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
                                        .foregroundStyle(.green)
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
