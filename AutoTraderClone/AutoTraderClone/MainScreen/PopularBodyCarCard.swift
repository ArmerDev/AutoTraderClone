//
//  PopularBodyCarCard.swift
//  AutoTraderClone
//
//  Created by James Armer on 24/01/2023.
//


import SwiftUI

struct PopularBodyCarCard: View {
    
    let imageName: String
    let bodyType: String
    let numberOfVehiclesInBodyType: Int

    var body: some View {
        VStack {
            ZStack {
             
            Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: 150,height: 100)
                
            Image("\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 150)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(bodyType)
                        .font(.caption)
                        .fontWeight(.medium)
                    
                    Text("\(numberOfVehiclesInBodyType)")
                        .font(.caption2)
                        .lineLimit(2)
                }
                Spacer()
            }
            .padding(5)
        }
        .frame(width: 150)
        .background(Color.white)
        .compositingGroup()
        .cornerRadius(5)
        .shadow(radius: 2)
        
    }
}

struct PopularBodyCarCard_Previews: PreviewProvider {
    static var previews: some View {
        PopularBodyCarCard(imageName: "Hatchback", bodyType: "Hatchback", numberOfVehiclesInBodyType: 5000)
    }
}
