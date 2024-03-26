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
    
    @State var text = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.isDataFetched {
                ScrollView {
                    VStack {
                        HStack {
                            TextField("Placeholder", text: $text)
                                .frame(height: 35)
                                .background(.gray)
                                .cornerRadius(8)
                            
                            Spacer(minLength: 50)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0...2, id: \.self) { index in
                                    Color.gray
                                        .frame(width: 130, height: 120)
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
