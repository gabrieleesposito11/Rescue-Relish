//
//  SuReView.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 18/10/23.
//

import SwiftUI

struct SuReView: View {
    
    @Environment (RecipeViewModel.self) var recipeViewModel 
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach (recipeViewModel.recipe.filter{$0.country == datas.country}) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe).environment(recipeViewModel), label: {
                        ZStack (alignment: .bottomLeading) {
                            Image(recipe.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height:200)
                                .clipped()
                            LinearGradient (colors: [.clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                            VStack (alignment: .leading){
                                
                            Text(recipe.name)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            } 
                            .foregroundStyle(Color.white)
                            .padding()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(height:200)
                        .padding()
                    })
                }
            }
            .navigationTitle("Fast Recipes")
        }
        .searchable(text: $searchText, prompt: "Search for a recipe")
    }
}

#Preview {
    SuReView().environment( RecipeViewModel())
}
