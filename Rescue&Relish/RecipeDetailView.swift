//
//  SuRecipeDetailView.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 18/10/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    // var reDeViewModel: RecipeViewModel
    var recipe : Recipe
    @Environment (RecipeViewModel.self) var recipeViewModel
    var recipeIndex : Int {
        recipeViewModel.recipe.firstIndex(where: {$0.id == recipe.id})!
    }
    
    var body: some View {
        @Bindable var recipeViewModel = recipeViewModel
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Spacer()
                FavoriteButton(isSaved: $recipeViewModel.recipe[recipeIndex].isSaved
                )
                .foregroundStyle(.yellow)
                .padding()
            }
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle())
                .shadow(radius: 10)
                .padding()
            Text(recipe.name)
                .font(.title)
                .bold()
            Text(recipe.time)
                .font(.title)
                .foregroundColor(.orange)
            Text(recipe.procedure)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text(recipe.ingredients)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let recipeViewModel = RecipeViewModel()
    return RecipeDetailView(recipe: recipeViewModel.recipe[0]).environment(recipeViewModel)
}
