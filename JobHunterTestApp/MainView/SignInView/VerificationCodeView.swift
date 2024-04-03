//
//  VerificationCodeView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    @EnvironmentObject private var mainViewCoordinator: MainViewCoordinator
    @StateObject private var viewModel = SignInViewModel()
//    @StateObject private var dataManager = DataManager.shared
    
    @FocusState var focusedField: FocusableField?
    
//    @State var verificationNumber: [String] = ["", "", "", ""]
    @State var isCodeEntered = false
    
    @Binding var enteredEmail: String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Отправили код на \(enteredEmail)")
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                
                Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                
                HStack {
                    ForEach(0...(FocusableField.allCases.count - 1), id: \.self) { index in
                        ZStack {
                            Color(.gray2)
                            
                            if viewModel.verificationNumber[index].count == 0 {
                                Text("*")
                                    .font(.system(size: 24, weight: .medium))
                                    .foregroundStyle(.gray3)
                                    .frame(height: 40)
                                    .padding(.horizontal, 8)
                                    .offset(y: 5)
                            }
                            
                            TextField("", text: $viewModel.verificationNumber[index])
                                .frame(width: 12, height: 48, alignment: .center)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .keyboardType(.numberPad)
                                .focused(
                                    $focusedField,
                                    equals:  viewModel.setUpFocusableField(index: index)
                                )
                                .onChange(of: viewModel.verificationNumber[index]) {
                                    viewModel.verificationNumber = viewModel.verificationNumber
                                        .map{ String($0.prefix(1)) }
                                    if viewModel.verificationNumber[index].count != 0 {
                                        focusedField = viewModel.focusNextField(
                                            focusedField: focusedField
                                        )
                                    }
//                                    let allFieldsFilled = viewModel.verificationNumber
//                                        .filter { $0.isEmpty }
//                                        .isEmpty
                                    if viewModel.verificationNumber.filter({ $0.isEmpty }).isEmpty {
                                        isCodeEntered = true
                                    } else {
                                        isCodeEntered = false
                                    }
                                }
                        }
                    }
                    .frame(width: 48, height: 48)
                    .cornerRadius(8)
                }
                
                Button {
                    viewModel.dataManager.isLoggedIn = true
                    mainViewCoordinator.push(.main(viewModel.dataManager.mainViewData))
                } label: {
                    ZStack {
                        if isCodeEntered {
                            Color.blue1
                            
                        } else {
                            Color.darkBlue
                        }
                        HStack {
                            Spacer()
                            
                            Text("Продолжить")
                                .font(.system(size: 14))
                                .foregroundStyle(
                                    !isCodeEntered ? .gray4 : .white
                                )
                            
                            Spacer()
                        }
                    }
                    .frame(height: 40)
                    .cornerRadius(8)
                    .shadow(color: .shadow, radius: 2, y:4)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1))
                }
                .disabled(!isCodeEntered)
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            focusedField = viewModel.focusFirstField()
        }
    }
}

#Preview {
    VerificationCodeView(enteredEmail: .constant("example@example.com"))
}
