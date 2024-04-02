//
//  SignInView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct SignInView: View {
//    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = SignInViewModel()
    
    @State var text = "" {
        didSet {
            
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if !viewModel.dataManager.isLoggedIn {
                VStack {
                    HStack {
                        Text("Вход в личный кабинет")
                            .font(.system(size: 21, weight: .semibold))
                            .frame(height: 24, alignment: .leading)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Color.gray1
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("Поиск работы")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            .padding(.top, 24)
                            .padding(.bottom, 16)
                            
                            ZStack {
                                Color(.gray2)
                                    .frame(height: 40)
                                    .cornerRadius(8)
                                    .shadow(color: .shadow, radius: 2, y:4)
                                
                                if text.count  < 1 {
                                    HStack {
                                        Image(.responsesDefault)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(.gray4)
                                        
                                        Text("Электронная почта или телефон")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.gray4)
                                        
                                        Spacer()
                                    }
                                    .frame(height: 40)
                                    .padding(.horizontal, 8)
                                }
                                
                                HStack {
                                    TextField("", text: $text)
                                        .frame(height: 40)
                                        .foregroundStyle(.white)
                                    
                                    if text.count > 0 {
                                        Button {
                                            text = ""
                                        } label: {
                                            Image(.bigCloseDefault)
                                                .foregroundColor(.gray5)
                                        }
                                    }
                                }
                                .padding(.horizontal, 8)
                                .shadow(color: .shadow, radius: 2, y:4)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(
                                        Color.red1,
                                        lineWidth:                                 viewModel.isErrorModePresented ? 1 : 0
                                    )
                            )
                            .onChange(of: text, {
                                if viewModel.isErrorModePresented {
                                    viewModel.isErrorModePresented = false
                                }
                            })
                            .padding(.bottom, 16)
                            
                            if viewModel.isErrorModePresented {
                                HStack {
                                    Text("Вы ввели неверный e-mail")
                                        .padding(.bottom, 16)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.red1)
                                    
                                    Spacer()
                                }
                            }
                            
                            
                            HStack(spacing: 8) {
                                Button {
                                    if !text.isEmpty {
                                        if !viewModel.validateEmail(text: text) {
                                            viewModel.isErrorModePresented = true
                                        }
                                        viewModel.continueButonTapped(with: text)
                                    }
                                } label: {
                                    ZStack {
                                        if !text.isEmpty {
                                            Color.blue1
                                            
                                        } else {
                                            Color.darkBlue
                                        }
                                        
                                        HStack {
                                            Spacer()
                                            
                                            Text("Продолжить")
                                                .font(.system(size: 14))
                                                .foregroundStyle(
                                                    text.isEmpty ? .gray4 : .white
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
                                .disabled(text.isEmpty)
                                .sheet(
                                    isPresented: $viewModel.isVerificationCodeViewPresented
                                ) {
                                    VerificationCodeView(enteredEmail: $text)
                                }
                                                                
                                Spacer()
                                
                                Button {} label: {
                                    Text("Войти с паролем")
                                        .font(.system(size: 14))
                                        .stroke(color: .black, width: 0.5)
                                        .shadow(color: .shadow, radius: 2, y:4)
                                }
                            }
                            .padding(.bottom, 24)
                            
                        }
                        .padding(.horizontal)
                        .layoutPriority(1)
                    }
                    .cornerRadius(8)
                    .padding(.vertical, 16)
                    
                    ZStack {
                        Color.gray1
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Поиск сотрудников")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.white)
                                .padding(.top, 24)
                            
                            
                            Text("Размещение вакансий и доступ к базе резюме")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                                .padding(.top, 8)
                            
                            Button {} label: {
                                ZStack {
                                    Capsule()
                                        .foregroundStyle(.green1)
                                    Text("Я ищу сотрудников")
                                        .foregroundStyle(.white)
                                }
                                .frame(height: 35)
                            }
                            .padding(.top, 16)
                            .padding(.bottom, 24)
                            
                        }
                        .padding(.horizontal)
                        .layoutPriority(1)
                    }
                    .cornerRadius(8)
                    .padding(.vertical, 16)
                    
                    Spacer()
                    
                    Text("Вход в личный кабинет")
                        .font(.system(size: 21, weight: .semibold))
                        .frame(height: 24, alignment: .leading)
                        .foregroundStyle(.black)
                }
                .padding()
            } else {
                MainView(mainViewDataResponse: DataManager.shared.mainViewData)
            }
        }
    }
}

#Preview {
    SignInView()
}

extension View {
    func stroke(color: Color, width: CGFloat = 1) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 0.5
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
        if strokeSize > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }
    
    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }
    
    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            if let resolvedView = context.resolveSymbol(id: id) {
                context.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}
