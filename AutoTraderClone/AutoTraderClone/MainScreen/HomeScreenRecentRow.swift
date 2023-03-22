//
//  HomeScreenRecentRow.swift
//  AutoTraderClone
//
//  Created by James Armer on 25/01/2023.
//

import SwiftUI

struct HomeScreenRecentRow: View {
    
    @EnvironmentObject var recentArray: RecentlyViewed
    
    @Binding var modifiableCarArray: [CarCardData]
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Recently viewed")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer(minLength: 3)
                HStack {
                    Spacer(minLength: 16)
                    ForEach(recentArray.recentlyViewedCars, id: \.self) { vehicle in
                        ForEach(modifiableCarArray.filter { $0.id == vehicle}) { car in
                            NavigationLink {
                                CarDetailView(carUUID: car.id, carImageName: car.imageName, carNumberOfImages: car.numberOfImages, carMake: car.make, carModel: car.model, carTagline: car.tagline, carPrice: car.price, carMileage: car.mileage, carBodyType: car.bodyType, carEngineSize: car.engineSize, carGearbox: car.gearbox, carFuelType: car.fuelType, carDoors: car.doors, carSeats: car.seats, carNumberOfOwners: car.numberOfOwners, carDescription: car.description, carSeller: car.seller, carSellerRating: car.sellerRating)
                            } label: {
                                CarCard(price: car.price, make: car.make, model: car.model, tagline: car.tagline, imageName: car.imageName)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    Spacer(minLength: 16)
                }
                Spacer(minLength: 10)
            }
        }
    }
}

struct HomeScreenRecentRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenRecentRow(modifiableCarArray: .constant([]))
    }
}
