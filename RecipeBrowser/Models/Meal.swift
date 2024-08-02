//
//  Meal.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/1/24.
//

import Foundation

struct Meal: Identifiable, Decodable {
    let id: String
    let name: String
    let thumbnail: URL?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

struct MealListResponse: Decodable {
    let meals: [Meal]
}
