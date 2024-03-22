//
//  Vacancy.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 22.03.2024.
//

import Foundation

struct MainViewDataResponse {
    let offers: [Offer]
    let vacancies: [Vacancy]
}

struct Offer {
    let id: String?
    let title: String
    let link: String
    let button: Button?
}

struct Button {
    let text: String
}

struct Vacancy {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address {
    let town: String
    let street: String
    let house: String
}

struct Experience {
    let previewText: String
    let text: String
}

struct Salary {
    let full: String
    let short: String?
}
