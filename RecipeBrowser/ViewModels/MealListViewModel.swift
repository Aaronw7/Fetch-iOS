//
//  MealListViewModel.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/1/24.
//

import Foundation

@MainActor
class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadMeals() async {
        isLoading = true
        errorMessage = nil
        do {
            meals = try await MealService.shared.fetchDesserts()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    var randomMealImages: [URL] {
        Array(meals.shuffled().prefix(3).compactMap { $0.thumbnail })
    }
}
