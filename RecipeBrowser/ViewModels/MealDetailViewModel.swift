//
//  MealDetailViewModel.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/6/24.
//

import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    @Published var selectedMeal: MealDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchMealDetail(id: String) async {
        isLoading = true
        do {
            selectedMeal = try await MealService.shared.fetchMealDetail(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
