//
//  PersonalInfoView.swift
//  RecipeApp
//
//  Created by Gabriele Esposito on 30/10/23.
//

import SwiftUI

struct PersonalInfoView: View {
    @State private var selectedCountry: String?
    @State private var selectedName : String = ""
    @State private var isActionSheetPresented: Bool = false
        
    let countries = ["Italy", "Iran", "Spain", "France", "India", "Japan", "Norway", "United States", "China"]
        
    var body: some View {
        VStack(spacing: 20) {
            Text("Help us save your food, enter your information:")
                .bold()
                .font(.largeTitle)
                .padding(.top, 10)
                .minimumScaleFactor(0.5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Name:")
                TextField("Name", text: $selectedName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                Text("Select your country:")
                Button(action: {
                    self.isActionSheetPresented.toggle()
                }) {
                    Text(selectedCountry ?? "Your country")
                        .foregroundColor(.orange)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                    
                }
                .actionSheet(isPresented: $isActionSheetPresented) {
                    ActionSheet(title: Text("Select your country"), buttons: countries.map { country in
                        .default(Text(country)) {
                            self.selectedCountry = country
                        }
                    })
                }
                HStack {
                    Spacer()
                    Image("Backgr2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.black)
                        .opacity(0.7)
                    .padding(.top, 50)
                    Spacer()
                }
            }
            .padding(20)
            Spacer()
            
            Button(action: {
                datas.country = selectedCountry ?? "Default"
                datas.name = selectedName
                
            })
            {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 40)
        }
        .padding()
    }
}

#Preview {
    PersonalInfoView()
}
