//
//  MainViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 21.03.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var dataManager = DataManager.shared
    
    @Published var isLoggedIn = false {
        didSet {
            dataManager.isLoggedIn = isLoggedIn
        }
    }
}
