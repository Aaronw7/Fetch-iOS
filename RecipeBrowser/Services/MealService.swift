//
//  MealService.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/1/24.
//

import Foundation

class MealService {
    static let shared = MealService()
    private let baseURL = "https://themealdb.com/api/json/v1/1/"

    func fetchDesserts() async throws -> [Meal] {
        let url = URL(string: "\(baseURL)filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealListResponse.self, from: data)
        return response.meals.sorted { $0.name < $1.name }
    }

    func fetchMealDetail(id: String) async throws -> MealDetail {
        let url = URL(string: "\(baseURL)lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        guard let mealDetail = response.meals.first else {
            throw URLError(.badServerResponse)
        }
        return mealDetail
    }
}
