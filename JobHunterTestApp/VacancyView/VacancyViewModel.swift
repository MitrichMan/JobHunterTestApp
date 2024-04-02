//
//  VacancyViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 29.03.2024.
//

import Foundation

class VacancyViewModel: ObservableObject {
    func getSchedulesString(from schedules: [String]) -> String {
        var schedulesString = ""
        for schedule in schedules  {
            if schedulesString.isEmpty {
                schedulesString = schedule.localizedCapitalized
            } else {
                schedulesString += ", \(schedule)"
            }
        }
        return schedulesString
    }
}
