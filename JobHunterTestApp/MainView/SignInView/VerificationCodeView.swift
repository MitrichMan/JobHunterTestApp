//
//  VerificationCodeView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = SignInViewModel()
    
    @State var verificationNumber: [String] = ["", "", "", ""]
    @State var isCodeEntered = false
    
    @FocusState var focusedField: FocusableField?
    
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
                                .frame(width: 48, height: 48)
                                .cornerRadius(8)
                                .shadow(color: .shadow, radius: 2, y:4)
                            
                            if verificationNumber[index].count == 0 {
                                Text("*")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray4)
                                    .frame(height: 40)
                                    .padding(.horizontal, 8)
                            }
                            
                            TextField("", text: $verificationNumber[index])
                                .frame(width: 11, height: 48, alignment: .center)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .keyboardType(.numberPad)
                                .focused(
                                    $focusedField,
                                    equals:  viewModel.setUpFocusableField(index: index)
                                )
                                .onChange(of: verificationNumber[index]) {
                                    if verificationNumber[index].count != 0 {
                                        focusNextField()
                                    }
                                    let allFieldsFilled = verificationNumber
                                        .filter { $0.isEmpty }
                                        .isEmpty
                                    if allFieldsFilled {
                                        isCodeEntered = true
                                    } else {
                                        isCodeEntered = false
                                    }
                                }
                        }
                    }
                }
                
                Button {
                    DataManager.shared.isLoggedIn = true
                    DataManager.shared.presentedTab = .main
                    coordinator.push(DataManager.shared.presentedTab)
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
            focusFirstField()
        }
    }
    
    func focusFirstField() {
        focusedField = FocusableField.allCases.first
    }
    
    func focusNextField() {
        switch focusedField {
        case .firstDigit:
            focusedField = .secondDigit
        case .secondDigit:
            focusedField = .thirdDigit
        case .thirdDigit:
            focusedField = .fourthDigit
        case .fourthDigit:
            focusedField = .fourthDigit
        case .none:
            break
        }
    }
}

#Preview {
    VerificationCodeView(enteredEmail: .constant("example@example.com"))
}
