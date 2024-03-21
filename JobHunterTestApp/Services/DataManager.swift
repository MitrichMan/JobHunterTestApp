//
//  DataManager.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 20.03.2024.
//

import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    @Published var isLoggedIn = false
    @Published var presentedTab: Page = .signIn
    
    let tabBarTabs: [Page] = [.main, .favourites, .responses, .messages, .profile]
        
    private init() {}
}
