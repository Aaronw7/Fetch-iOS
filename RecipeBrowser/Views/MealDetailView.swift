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
        ZStack {
            GeometryReader { geometry in
                Image("neutral-background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    .clipped()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }

            ScrollView {
                VStack {
                    GeometryReader { geometry in
                        if let thumbnail = viewModel.selectedMeal?.thumbnail {
                            AsyncImage(url: thumbnail) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.top)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        if let meal = viewModel.selectedMeal {
                            Text(meal.name)
                                .font(
                                    .largeTitle
                                        .weight(.heavy)
                                )
                                .padding(.vertical)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.8))
                                        .padding(.horizontal, -10) .padding(.vertical, -5)
                                )
                            
                            VStack {
                                Text("Instructions")
                                    .font(
                                        .title2
                                            .weight(.bold)
                                    )
                                    .padding(.bottom)
                                    .underline()
                                
                                Text(meal.instructions)
                            }
                            
                            VStack {
                                Text("Ingredients")
                                    .font(
                                        .title2
                                            .weight(.bold)
                                    )
                                    .padding(.bottom)
                                    .underline()
                                
                                ForEach(meal.ingredients) { ingredient in
                                    HStack {
                                        Text(ingredient.name)
                                        Spacer()
                                        Text(ingredient.measure)
                                    }
                                }
                            }
                            .padding(.vertical, 32)
                            .padding(.horizontal, 40)
                            .background(Color.white.opacity(0.8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.black, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.top, -50)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .background(Color.white.opacity(0.25))
                }
            }
            .navigationTitle(viewModel.selectedMeal?.name ?? "Meal Details")
            .onAppear {
                Task {
                    await viewModel.fetchMealDetail(id: mealID)
                }
            }
        }
    }
}

#Preview {
    MealDetailView(mealID: "52772")
}
