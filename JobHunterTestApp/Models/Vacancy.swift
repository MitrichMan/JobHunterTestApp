//
//  Vacancy.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 22.03.2024.
//

import Foundation

struct MainViewDataResponse: Decodable, Hashable {
    let offers: [Offer]
    var vacancies: [Vacancy]
}

struct Offer: Decodable, Hashable {
    let id: String?
    let title: String
    let link: String
    let button: OfferButton?
}

struct OfferButton: Decodable, Hashable {
    let text: String
}

struct Vacancy: Decodable, Hashable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address: Decodable, Hashable {
    let town: String
    let street: String
    let house: String
}

struct Experience: Decodable, Hashable {
    let previewText: String
    let text: String
}

struct Salary: Decodable, Hashable {
    let full: String
    let short: String?
}
