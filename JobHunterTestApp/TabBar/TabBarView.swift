//
//  TabBarView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.gray)

                HStack {
                    ForEach(0...4, id: \.self) { index in
                        Button(action: {}, label: {
                            VStack {
                                Image(.searchDefault)
                                    .frame(width: 24, height: 24)
                                    .padding(.horizontal)
                                Text((index + 1).formatted())
                            }
                        })
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
