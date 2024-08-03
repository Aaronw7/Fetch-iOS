//
//  MealDetailView.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/2/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    
    var body: some View {
        VStack {
            if let url = meal.thumbnail {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }
            }
            Text(meal.name)
                .font(.title)
                .padding()
            // Add more meal details here
            Spacer()
        }
        .padding()
        .navigationTitle(meal.name)
    }
}

#Preview {
    MealDetailView(meal: Meal(id: "52772", name: "Dessert Name", thumbnail: URL(string: "https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg")))
}

