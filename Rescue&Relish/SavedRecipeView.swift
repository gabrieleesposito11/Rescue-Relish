//
//  SavedRecipesView.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 19/10/23.
//

import SwiftUI

struct SavedRecipesView: View {
    
    @Environment (RecipeViewModel.self) var recipeViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(recipeViewModel.recipe.filter { $0.isSaved }){ recipe in
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
                                
                            } .foregroundStyle(Color.white)
                                .padding()
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(height:200)
                        .padding()
                    })
                }
            }.navigationTitle("Saved Recipes")
        }
    }
}

#Preview {
    SavedRecipesView().environment(RecipeViewModel())
}
