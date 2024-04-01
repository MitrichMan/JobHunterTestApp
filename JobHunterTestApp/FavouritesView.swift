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
            
            Text("Favourites")
                .font(.system(size: 40))
                .foregroundStyle(.white)
        }
        .onAppear(perform: {
            print(favourites.count.formatted())
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FavouritesView(favourites: [])
}
