//
//  TabBarViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    
    @Published var dataManager = DataManager.shared
    
    @Published var foregroundColor = Color.gray
    
    func getcolor(if tab: Page, matches selectedTab: Page) -> Color {
        if tab == selectedTab {
            return Color.blue
        } else {
            return Color.gray
        }
    }
}
