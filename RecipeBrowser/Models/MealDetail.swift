//
//  MealDetail.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/6/24.
//

import Foundation

struct MealDetail: Identifiable, Decodable {
    let id: String
    let name: String
    let instructions: String
    let thumbnail: URL?
    let tags: [String]?
    let youtube: URL?
    let ingredients: [Ingredient]
    
    struct Ingredient: Identifiable {
        let id = UUID()
        let name: String
        let measure: String
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnail = try container.decodeIfPresent(URL.self, forKey: .thumbnail)
        
        if let tagsString = try container.decodeIfPresent(String.self, forKey: .tags) {
            tags = tagsString.split(separator: ",").map { String($0) }
        } else {
            tags = nil
        }
        
        youtube = try container.decodeIfPresent(URL.self, forKey: .youtube)
        
        var ingredients: [Ingredient] = []
        
        for i in 1...20 {
            let ingredientKey = CodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = CodingKeys(stringValue: "strMeasure\(i)")!
            if let ingredientName = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredientName.isEmpty,
               let measure = try container.decodeIfPresent(String.self, forKey: measureKey),
               !measure.isEmpty {
                ingredients.append(Ingredient(name: ingredientName, measure: measure))
            }
        }
        
        self.ingredients = ingredients
    }
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]
}
