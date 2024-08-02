//
//  ContentView.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/1/24.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]


    @State var selected = "Baseball"
    @State private var id = 1
    
    var body: some View {
        VStack {
            Text("Recipe Browser")
                .font(.largeTitle.bold())
            
            Spacer()
            
            VStack{
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    )
                Text("\(selected)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            }
            .transition(.slide)
            .id(id)
            
            Spacer()
            
            Button("Try Again") {
                withAnimation(.easeInOut(duration: 1)){
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
