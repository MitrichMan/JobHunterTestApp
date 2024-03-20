//
//  TabBarView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 1.3)
                .foregroundStyle(.gray)
            
            HStack {
                ForEach(0...4, id: \.self) { index in
                    Button
                    {
                        switch index {
                        case 0 :
                            coordinator.push(.main)
                        case 1 :
                            coordinator.push(.favourites)
                        case 2 :
                            coordinator.push(.responses)
                        case 3 :
                            coordinator.push(.messages)
                        case 4 :
                            coordinator.push(.profile)
                        default:
                            return
                        }
                        
                    }
                label: {
                    VStack {
                        Image(.searchDefault)
                            .frame(width: 24, height: 24)
                            .padding(.horizontal)
                        Text("Избранное")
                            .font(.system(size: 11))
                    }
                    .foregroundStyle(.gray)
                }
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
