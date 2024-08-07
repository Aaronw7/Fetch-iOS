//
//  MealDetailView.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/2/24.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = MealDetailViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else if let meal = viewModel.selectedMeal {
                Text(meal.name)
                    .font(.largeTitle)
                Text(meal.instructions)
                ForEach(meal.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text(ingredient.measure)
                    }
                }
            } else {
                Text("No meal details available.")
            }
        }
        .padding()
        .navigationTitle("Meal Details")
        .onAppear {
            Task {
                await viewModel.fetchMealDetail(id: mealID)
            }
        }
    }
}

#Preview {
    MealDetailView(mealID: "52772")
}
