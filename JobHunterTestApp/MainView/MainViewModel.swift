//
//  MainViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 21.03.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {    
    @Published var vacancies: [Vacancy] = DataManager.shared.mainViewData.vacancies
    
    var offers: [Offer] = DataManager.shared.mainViewData.offers
        
    var isLoggedIn = false
    
    func setAvatarForOfferCell(with index: Int) -> Image {
        switch offers[index].id {
        case "near_vacancies":
            Image(.vacanciesDefault)
        case "level_up_resume":
            Image(.smallStarDefault)
        case "temporary_job":
            Image(.vacancies2Default)
        default:
            Image(.bigCloseDefault)
        }
    }
    
    func getCircleColor(with index: Int) -> [Color] {
        switch offers[index].id {
        case "near_vacancies":
            [Color.darkBlue, Color.blue1]
        case "level_up_resume":
            [Color.darkGreen, Color.green1]
        case "temporary_job":
            [Color.darkGreen, Color.green1]
        default:
            [Color.gray2, Color.gray3]
        }
    }
}


