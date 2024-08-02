//
//  EntryView.swift
//  RecipeBrowser
//
//  Created by Aaron Wang on 8/2/24.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("macarons")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    VStack {
                        Spacer()
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.6)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: geometry.size.height * 0.5)
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    
                    VStack {
                        Spacer()
                        VStack (alignment: .leading) {
                            Text("Let's Satisfy That Sweet Tooth")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.white)
                            Divider()
                            HStack {
                                Text("Find the desserts you crave")
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                Spacer()
                                NavigationLink(destination: MealListView()) {
                                    Text("Explore")
                                }
                                .buttonStyle(CustomButtonStyle())
                            }
                        }
                        .padding(20)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(.black)
                .padding(.trailing, 5)
            Image(systemName: "arrow.right")
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray, radius: configuration.isPressed ? 2 : 5, x: 0, y: configuration.isPressed ? 1 : 3)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

#Preview {
    EntryView()
}
