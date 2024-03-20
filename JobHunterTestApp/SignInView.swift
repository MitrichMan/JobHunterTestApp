//
//  SignInView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct SignInView: View {
    @State var text = ""
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Spacer()
            
            VStack {
                Spacer()
                
                ZStack {
                    Color.gray
                    
                    VStack {
                        HStack {
                            Text("Sign In")
                            
                            Spacer()
                        }
                        
                        TextField("Placeholder", text: $text)
                            .textFieldStyle(.roundedBorder)
                        
                        
                        HStack {
                            Button {} label: {
                                HStack {
                                    Spacer()
                                    
                                    Text("Continue")
                                    
                                    Spacer()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            
                            Button {} label: {
                                Text("Enter with password")
                            }
                        }
                    }
                    .padding()
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
                }
                .cornerRadius(12)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    SignInView()
}
