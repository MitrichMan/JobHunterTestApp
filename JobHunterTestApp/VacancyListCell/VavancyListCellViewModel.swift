//
//  VavancyListCellViewModel.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 26.03.2024.
//

import Foundation

class VavancyListCellViewModel: ObservableObject {
    
    @Published var vacancy = Vacancy(
        id: "",
        lookingNumber: 0,
        title: "",
        address: Address(
            town: "",
            street: "",
            house: ""
        ),
        company: "",
        experience: Experience(
            previewText: "",
            text: ""
        ),
        publishedDate: "",
        isFavorite: false,
        salary: Salary(
            full: "",
            short: nil
        ),
        schedules: [
            "",
            ""
        ],
        appliedNumber: 0,
        description: "",
        responsibilities: "",
        questions: []
    )
    
    func toggleFavouriteStatus() {
        vacancy.isFavorite.toggle()
    }
    
    func getFormattedDate(from string: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        guard let publishedDate = dateFormatter.date(from: string) else { return dateFormatter.string(from:Date.now) }
        dateFormatter.dateFormat = "d MMMM"
        
        return dateFormatter.string(from: publishedDate)
    }
}
