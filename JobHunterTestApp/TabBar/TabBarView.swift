//
//  TabBarView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack {
            ForEach(0...3, id: \.self) { index in
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "checkmark")
                        Text((index + 1).formatted())
                    }
                })
            }
        }
    }
}

#Preview {
    TabBarView()
}
