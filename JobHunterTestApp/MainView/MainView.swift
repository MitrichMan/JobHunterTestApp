//
//  MainView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = MainViewModel()
    @StateObject var dataManager = DataManager.shared
    
    @State var searchPromptText = ""
    
    var mainViewDataResponse: MainViewDataResponse

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if dataManager.isDataFetched {
                ScrollView {
                    VStack {
                        HStack {
                            ZStack {
                                Color(.gray2)
                                    .frame(height: 40)
                                    .cornerRadius(8)
                                    .shadow(color: .shadow, radius: 2, y: 4)
                                
                                HStack {
                                    Image(.searchDefault)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.gray4)
                                    
                                    if searchPromptText.count  < 1 {
                                        Text("Должность, ключевые слова")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.gray4)
                                    }
                                    
                                    Spacer()
                                    
                                }
                                .frame(height: 40)
                                .padding(.horizontal, 8)
                                
                                HStack {
                                    Spacer(minLength: 32)
                                    TextField("", text: $searchPromptText)
                                        .frame(height: 40)
                                        .foregroundStyle(.white)
                                }
                                .padding(.horizontal, 8)
                                .shadow(color: .shadow, radius: 2, y:4)
                            }
                            
                            Spacer(minLength: 50)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0...(viewModel.offers.count - 1), id: \.self) { index in
                                    ZStack {
                                        Color.gray1
                                        
                                        VStack(alignment: .leading) {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 32)
                                                        .foregroundColor(
                                                            viewModel.getCircleColor(with: index).first
                                                        )
                                                    
                                                    viewModel.setAvatarForOfferCell(with: index)
                                                        .foregroundColor(
                                                            viewModel.getCircleColor(with: index).last
                                                        )
                                                }
                                                .padding(.bottom)
                                            
                                            
                                            Text(viewModel.offers[index].title)
                                                .font(.system(size: 14, weight: .medium))
                                                .multilineTextAlignment(.leading)
                                                .foregroundStyle(.white)
                                                
                                            
                                            if viewModel.offers[index].id == "level_up_resume" {
                                                Button {} label: {
                                                    Text("Поднять")
                                                        .font(.system(size: 14))
                                                        .foregroundStyle(.green1)
                                                }
                                            } else {
                                                Spacer()
                                            }
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                    .frame(width: 150, height: 140)
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        HStack {
                            Text("Вакансии для вас")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        
                        ForEach(0...2, id: \.self) { index in
                            VacancyListCellView(
                                vacancy: viewModel.vacancies[index]
                            )
                            .onTapGesture(perform: {
                                coordinator.push(.vacancy(viewModel.vacancies[index]))
                            })
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        Button {
                            coordinator.push(.vacancyList(viewModel.vacancies))
                        } label: {
                            HStack {
                                Spacer()
                                
                                Text("Еще 143 вакансии")
                                
                                Spacer()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView(mainViewDataResponse: DataManager.shared.mockMainViewDataResponse)
}
