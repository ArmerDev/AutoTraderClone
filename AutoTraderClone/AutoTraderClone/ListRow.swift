//
//  ListRow.swift
//  AutoTraderClone
//
//  Created by James Armer on 22/12/2022.
//

import SwiftUI

struct ListRow: View {
    
    @Binding var arrayOfRecentlyViewed: [UUID]
    
    @EnvironmentObject var modify: Cars
    
    let carUUID: UUID
    let carImageName: String
    let carMake: String
    let carModel: String
    let carTagline: String
    let carPrice: Int
    let carYear: Int
    let carMileage: Int
    let carNumberOfImages: Int
    let carBodyType: String
    let carEngineSize: Double
    let carIsLiked: Bool
    let carFuelType: String
    let carGearbox: String
    let carDoors: Int
    let carSeats: Int
    let carNumberOfOwners: Int
    let carDescription: String
    let carSeller: String
    let carSellerRating: Double
    let location: String
    let distance: Int
    let distanceString: String
    
    init(arrayOfRecentlyViewed: Binding<[UUID]>, carUUID: UUID, carImageName: String, carMake: String, carModel: String, carTagline: String, carPrice: Int, carYear: Int, carMileage: Int, carNumberOfImages: Int, carBodyType: String, carEngineSize: Double, carIsLiked: Bool, carFuelType: String, carGearbox: String, carDoors: Int, carSeats: Int, carNumberOfOwners: Int, carDescription: String, carSeller: String, carSellerRating: Double, location: String, distance: Int) {
        self._arrayOfRecentlyViewed = arrayOfRecentlyViewed
        self.carUUID = carUUID
        self.carImageName = carImageName
        self.carMake = carMake
        self.carModel = carModel
        self.carTagline = carTagline
        self.carPrice = carPrice
        self.carYear = carYear
        self.carMileage = carMileage
        self.carNumberOfImages = carNumberOfImages
        self.carBodyType = carBodyType
        self.carEngineSize = carEngineSize
        self.carIsLiked = carIsLiked
        self.carFuelType = carFuelType
        self.carGearbox = carGearbox
        self.carDoors = carDoors
        self.carSeats = carSeats
        self.carNumberOfOwners = carNumberOfOwners
        self.carDescription = carDescription
        self.carSeller = carSeller
        self.carSellerRating = carSellerRating
        self.location = location
        self.distance = distance
        self.distanceString = "\(location) (\(distance) miles)"
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationLink {
            CarDetailView(carUUID: carUUID, carImageName: carImageName, carNumberOfImages: carNumberOfImages, carMake: carMake, carModel: carModel, carTagline: carTagline, carPrice: carPrice, carMileage: carMileage, carBodyType: carBodyType, carEngineSize: carEngineSize, carGearbox: carGearbox, carFuelType: carFuelType, carDoors: carDoors, carSeats: carSeats, carNumberOfOwners: carNumberOfOwners, carDescription: carDescription, carSeller: carSeller, carSellerRating: carSellerRating)
        } label: {
         
            
            VStack(spacing: 0) {
                HStack {
                    Image("\(carImageName)-1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Image("\(carImageName)-2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("\(carImageName)-3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 138)
                }
                .frame(maxWidth: .infinity)
                .background(Color("AutoTraderCream"))
                .padding(.bottom, 6)
                
                HStack {
                    Text("£\(carPrice)")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        modify.toggleIsLiked(carUUID: carUUID)
                    } label: {
                        HStack {
                            Image(systemName: modify.checkIsLiked(carUUID: carUUID) ? "heart.fill": "heart")
                                .foregroundColor(.red)
                            
                            Text(modify.checkIsLiked(carUUID: carUUID) ? "Saved" : "Save")
                        }
                        .transaction { transaction in
                            transaction.animation = nil
                        }
                    }
                    .buttonStyle(.plain)

                }
                .padding(6)
                
                HStack {
                    Text("\(carMake) \(carModel) \(carTagline)")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding([.horizontal, .bottom], 6)
                

                HStack {
                    HStack{
                        Image("YearIconTextView")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 17)
                        Text(String(carYear))
                            .font(.footnote)
                    }
                    
                    HStack {
                        Image("MileageIconTextView")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 17)
                        Text("\(carMileage) miles")
                            .font(.footnote)
                    }
                    Spacer()
                }
                .padding([.horizontal, .bottom], 6)
                
                HStack {
                    HStack{
                        Image("LocationIconTextView")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 17)
                        
                        
                        Text("\(location) (\(distance) miles)")
                            .font(.footnote)
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 6)
                .padding(.bottom)
                
            }
            .background(Color("AutoTraderHeader"))
            .overlay(alignment: .topLeading, content: {
                
                Text("\(Image(systemName: "camera")) \(carNumberOfImages)")
                    .foregroundColor(.white)
                    .font(.caption2)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 5)
                    .background((Color("DarkGray")).opacity(0.75))
                    .allowsHitTesting(false)
            })
            .cornerRadius(5)
            .shadow(radius: 2)
            .padding(7)

        }
        .buttonStyle(.plain)

    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(arrayOfRecentlyViewed: .constant([]), carUUID: UUID(uuidString: "D6C6F715-5A4B-4500-8E00-2528614C812D")!,carImageName: "449B6A4D-071F-4806-BE16-F78E382A2DDC", carMake: "BMW", carModel: "4 Series", carTagline: "Nice car", carPrice: 13555, carYear: 2018, carMileage: 122000, carNumberOfImages: 3, carBodyType: "Coupe", carEngineSize: 1.0, carIsLiked: true, carFuelType: "Petrol", carGearbox: "Automatic", carDoors: 2, carSeats: 4, carNumberOfOwners: 1, carDescription: "Wonderful example", carSeller: "Prestige cars", carSellerRating: 4.2, location: "Manchester", distance: 48)
    }
}
