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
    
    @State var searchPromptText = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.isDataFetched {
                ScrollView {
                    VStack {
                        HStack {
                            ZStack {
                                Color(.gray2)
                                    .frame(height: 40)
                                    .cornerRadius(8)
                                    .shadow(color: .shadow, radius: 2, y:4)
                                
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
                                ForEach(0...viewModel.offers.count - 1, id: \.self) { index in
                                    ZStack {
                                        Color.gray
                                        
                                        VStack {
                                            HStack {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 32)
                                                        .foregroundStyle(.darkBlue)
                                                    Image(.vacanciesDefault)
                                                        .foregroundStyle(.blue1)
                                                }
                                                
                                                Spacer()
                                            }
                                            Text(viewModel.offers[index].title)
                                                .font(.system(size: 14, weight: .medium))
                                                .multilineTextAlignment(.leading)
                                                .foregroundStyle(.white)
                                            
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                    .frame(width: 160, height: 140)
                                    .cornerRadius(8)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        }
                        
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
                                vacancy: viewModel.mainViewData.vacancies[index]
                            )
                            .onTapGesture(perform: {
                                coordinator.push(.vacancy)
                            })
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        Button {
                            coordinator.push(.vacancyList)
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
        
        // TODO: - fetch real data mhen API is fixed
        .task {
            //            await viewModel.fetchMainViewData()
            await viewModel.fetchMockData()
        }
    }
}

#Preview {
    MainView()
}
