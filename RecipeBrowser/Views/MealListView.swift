//
//  ContentView.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/1/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject var viewModel = MealListViewModel()
    
    var body: some View {
        VStack {
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
                
                VStack {
                    HStack {
                        Text("Discover your favorite desserts")
                            .font(.title.bold())
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)

                        Spacer()
                    }
                    
                    
                    if !viewModel.randomMealImages.isEmpty {
                        TabView {
                            ForEach(viewModel.randomMealImages, id: \.self) { url in
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .cornerRadius(12)
                        .frame(height: 200)
                        .tabViewStyle(PageTabViewStyle())
                    }
                    
                    
                    Divider()
                    
                    List(viewModel.meals) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal)) {
                            HStack {
                                if let url = meal.thumbnail {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 50, height: 50)
                                }
                                Text(meal.name)
                                    .font(.headline.bold())
                            }
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(white: 0.93, opacity: 1))
                                .padding(
                                    EdgeInsets(
                                        top: 3,
                                        leading: 0,
                                        bottom: 3,
                                        trailing: 0
                                    )
                                )
                        )
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .cornerRadius(12)
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Desserts List")
                    .onAppear {
                        Task {
                            await viewModel.loadMeals()
                        }
                    }
                    .overlay {
                        if viewModel.isLoading {
                            ProgressView("Loading...")
                        }
                    }
                    .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                        Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
                    }
                }
                .padding(.horizontal)
            }
        
        }
    }
}

#Preview {
    MealListView()
}
