//
//  Network Manager.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 22.03.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMainViewDataResponse() async throws -> MainViewDataResponse {
        guard let url = URL(string: API.mainViewData.rawValue) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        guard let mainViewDataResponse = try? decoder.decode(MainViewDataResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return mainViewDataResponse
    }
}

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

enum API: String {
    case mainViewDataOld = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
    case mainViewData = "https://docs.google.com/document/d/1pPHmvMqAX7MSun2xkJV4znBzLx1MfofffoZftTFLnzI/edit?usp=sharing"
}
