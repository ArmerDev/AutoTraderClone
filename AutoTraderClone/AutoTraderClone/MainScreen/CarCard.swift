//
//  CarCard.swift
//  AutoTraderClone
//
//  Created by James Armer on 21/12/2022.
//

import SwiftUI

struct CarCard: View {
    let price: Int
    let make: String
    let model: String
    let tagline: String
    let imageName: String

    var body: some View {
        VStack {
            ZStack {
             
            Rectangle()
                    .foregroundColor(Color("AutoTraderCream"))
                    .frame(width: 150,height: 100)
                
            Image("\(imageName)-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            }

            HStack {
                VStack(alignment: .leading) {
                    Text(price.formatted(.currency(code: "GBP")))
                        .font(.caption)
                        .fontWeight(.medium)
                    Text("\(make) \(model)")
                        .font(.caption2)
                    Text(tagline)
                        .font(.caption2)
                        .lineLimit(2)
                }
                Spacer()
            }
            .padding(5)
        }
        .frame(width: 150)
        .background(Color("AutoTraderHeader"))
        .compositingGroup()
        .cornerRadius(5)
        .shadow(radius: 2)
        
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard(price: 140000, make: "BMW", model: "M4", tagline: "Some sort of car", imageName: "435d")
    }
}
