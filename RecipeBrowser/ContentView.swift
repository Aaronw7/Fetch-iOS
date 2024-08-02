//
//  ContentView.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MealListViewModel()
    
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]


    @State var selected = "Baseball"
    @State private var id = 1
    
    var body: some View {
        VStack {
            Text("Recipe Browser")
                .font(.largeTitle.bold())
            
            Spacer()
            
            List(viewModel.meals) { meal in
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
                }
            }
            .listStyle(.inset)
            .padding()
            .navigationTitle("Desserts")
            .onAppear {
                Task {
                    await viewModel.loadMeals()
                }
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                else {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.black, lineWidth: 2)
                }
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
            }
            
//            VStack{
//                Circle()
//                    .fill(colors.randomElement() ?? .blue)
//                    .padding()
//                    .overlay(
//                        Image(systemName: "figure.\(selected.lowercased())")
//                            .font(.system(size: 144))
//                            .foregroundColor(.white)
//                    )
//                Text("\(selected)")
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//
//            }
//            .transition(.slide)
//            .id(id)
            
//            Spacer()
//            
//            Button("Try Again") {
//                withAnimation(.easeInOut(duration: 1)){
//                    selected = activities.randomElement() ?? "Archery"
//                    id += 1
//                }
//            }
//            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
