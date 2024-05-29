//
//  Recipe.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 18/10/23.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    var id: UUID = UUID()
    var name: String
    var time: String
    var procedure: String
    var imageName: String
    var ingredients: String
    var isSaved: Bool = false
    var country : String = ""
}
