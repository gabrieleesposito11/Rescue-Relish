//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 18/10/23.
//

import SwiftUI
import Observation

@main
struct Rescue_RelishApp: App {
    
    var recipeViewModel = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                SuReView()
                    .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
                
                SavedRecipesView()
                    .tabItem {
                    Label("Saved", systemImage: "square.and.arrow.down")
                }
                
                PersonalInfoView()
                    .tabItem {
                    Label("Personal Area", systemImage: "person.fill")
                }
            }
            .environment(recipeViewModel)
        }
    }
}
