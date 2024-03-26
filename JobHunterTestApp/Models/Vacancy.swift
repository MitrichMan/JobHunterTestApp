//
//  Vacancy.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 22.03.2024.
//

import Foundation

struct MainViewDataResponse: Decodable {
    let offers: [Offer]
    let vacancies: [Vacancy]
}

struct Offer: Decodable {
    let id: String?
    let title: String
    let link: String
    let button: OfferButton?
}

struct OfferButton: Decodable {
    let text: String
}

struct Vacancy: Decodable {
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

struct Address: Decodable {
    let town: String
    let street: String
    let house: String
}

struct Experience: Decodable {
    let previewText: String
    let text: String
}

struct Salary: Decodable {
    let full: String
    let short: String?
}
