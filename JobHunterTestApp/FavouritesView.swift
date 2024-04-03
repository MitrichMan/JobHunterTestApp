//
//  FavouritesView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var favourites: [Vacancy]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Избранное")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("1 вакансия")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray3)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    
//                    ForEach(0...(favourites.count - 1), id: \.self) { index in
//                        VacancyListCellView(
//                            vacancy: favourites[index]
//                        )
//                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}
    
    #Preview {
        FavouritesView(favourites: DataManager.shared.mockMainViewDataResponse.vacancies)
    }
    
