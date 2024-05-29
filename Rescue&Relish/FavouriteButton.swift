//
//  FavouriteButton.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 24/10/23.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSaved: Bool
    
    var body: some View {
        Button {
            isSaved.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSaved ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSaved ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSaved: .constant(true))
}


