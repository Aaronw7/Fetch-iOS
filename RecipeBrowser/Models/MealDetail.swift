//
//  MealDetail.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/6/24.
//

import Foundation

struct MealDetail: Decodable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: URL?
    let ingredients: [Ingredient]

    struct Ingredient: Identifiable {
        let id = UUID()
        let name: String
        let measure: String
    }

    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strInstructions
        case strMealThumb
        case ingredients
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decodeIfPresent(URL.self, forKey: .strMealThumb)

        var ingredients: [Ingredient] = []

        for i in 1...20 {
            let ingredientKey = CodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = CodingKeys(stringValue: "strMeasure\(i)")!
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty,
               let measure = try container.decodeIfPresent(String.self, forKey: measureKey), !measure.isEmpty {
                ingredients.append(Ingredient(name: ingredient, measure: measure))
            }
        }

        self.ingredients = ingredients
    }
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}
