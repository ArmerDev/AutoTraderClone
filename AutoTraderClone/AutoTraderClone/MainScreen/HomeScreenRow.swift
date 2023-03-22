//
//  HomeScreenRow.swift
//  AutoTraderClone
//
//  Created by James Armer on 25/01/2023.
//

import SwiftUI

struct HomeScreenRow: View {
    
    @Binding var modifyCarArray: [CarCardData]
    @Binding var arrayOfRecentlyViewed: [UUID]
    @Binding var sortedBy: String
    @Binding var showOptions: Bool
    @Binding var carsArray: [CarCardData]
    @State var selectedModel: String
    
    var homeRowHeading: String
    let sortOptions = ["Price (Lowest)", "Price (Highest)", "Distance", "Mileage", "Age (Newest first)", "Age (Oldest first)", "Most recent"]
    
    var body: some View {
        //BMW 5 Series
        VStack(alignment: .leading) {
            
            HStack {
                Text(homeRowHeading)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink {
                    VStack {
                        ScrollView {
                            
                            HStack {
                                Text("\(modifyCarArray.filter{$0.model == selectedModel }.count) cars found")
                                Spacer()
                            }
                            .padding()
                            
                            HStack {
                                
                                Menu {
                                    Picker("Sort Options", selection: $sortedBy) {
                                        ForEach(sortOptions, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                } label: {
                                    Text("\(Image(systemName: "arrow.up.arrow.down")) Sort by")
                                }
                                
                                Button {
                                    print("i")
                                } label: {
                                    Image(systemName: "info.circle")
                                }
                                
                                Spacer()
                                
                                Button {
                                    showOptions.toggle()
                                    
                                } label: {
                                    Text("\(Image(systemName: "slider.horizontal.3")) Options")
                                }
                            }
                            .padding()
                            
                            ForEach(modifyCarArray.filter{$0.model == selectedModel}.sorted {
                                switch sortedBy {
                                case "Price (Lowest)": return $0.price < $1.price
                                case "Price (Highest)": return $0.price > $1.price
                                case "Distance": return $0.distance < $1.distance
                                case "Mileage": return $0.mileage < $1.mileage
                                case "Age (Newest first)": return $0.year > $1.year
                                case "Age (Oldest first)": return $0.year < $1.year
                                case "Most recent": return $0.dateAdded > $1.dateAdded
                                default: return $0.imageName < $1.imageName
                                }
                            }) { data in
                                ListRow(arrayOfRecentlyViewed: $arrayOfRecentlyViewed, carUUID: data.id, carImageName: data.imageName, carMake: data.make, carModel: data.model, carTagline: data.tagline, carPrice: data.price, carYear: data.year, carMileage: data.mileage, carNumberOfImages: data.numberOfImages, carBodyType: data.bodyType, carEngineSize: data.engineSize, carIsLiked: data.isLiked, carFuelType: data.fuelType, carGearbox: data.gearbox, carDoors: data.doors, carSeats: data.seats, carNumberOfOwners: data.numberOfOwners, carDescription: data.description, carSeller: data.seller, carSellerRating: data.sellerRating, location: data.location, distance: data.distance)
                            }
                        }
                    }
                    .toolbar {
                        Button {
                            print("Save Search")
                        } label: {
                            Text("Save Search")
                        }
                    }
                    .sheet(isPresented: $showOptions) {
                        FilterView(modifiableSearchA5: $modifyCarArray, searchA5: $carsArray)
                            .navigationTitle("Hello")
                    }
                } label: {
                    Text("\(Image(systemName: "arrow.forward"))")
                        .font(.title3)
                        .foregroundColor(Color("AutoTraderBlue"))
                }
                .onAppear {
                    modifyCarArray = carsArray
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer(minLength: 3)
                HStack {
                    Spacer(minLength: 16)
                    ForEach(carsArray.filter { $0.model == selectedModel}) { car in
                        NavigationLink {
                            CarDetailView(carUUID: car.id, carImageName: car.imageName, carNumberOfImages: car.numberOfImages, carMake: car.make, carModel: car.model, carTagline: car.tagline, carPrice: car.price, carMileage: car.mileage, carBodyType: car.bodyType, carEngineSize: car.engineSize, carGearbox: car.gearbox, carFuelType: car.fuelType, carDoors: car.doors, carSeats: car.seats, carNumberOfOwners: car.numberOfOwners, carDescription: car.description, carSeller: car.seller, carSellerRating: car.sellerRating)
                        } label: {
                            CarCard(price: car.price, make: car.make, model: car.model, tagline: car.tagline, imageName: car.imageName)
                        }
                        .buttonStyle(.plain)
                    }
                    Spacer(minLength: 16)
                }
                Spacer(minLength: 10)
            }
            .padding(.top, -3)
            .padding(.horizontal, -16)
        }
        .padding(.horizontal)
        
    }
}

struct HomeScreenRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenRow(homeRowHeading: "Audi", modifyCarArray: .constant([CarCardData(id: UUID(), make: "", model: "", modelVariant: "", price: 1, color: "", year: 1, mileage: 1, fuelType: "", engineSize: 1.1, enginePower: 1, acceleration: 1.1, gearbox: "", seats: 1, doors: 1, imageName: "", numberOfImages: 1, dateAdded: 1, numberOfOwners: 1, bodyType: "", seller: "", sellerRating: 1.1, description: "", tagline: "", location: "", distance: 1, isLiked: true, recentlyViewed: true)]), arrayOfRecentlyViewed: .constant([]), selectedModel: "5 Series", sortedBy: .constant("Tagline"), showOptions: .constant(true), carsArray: .constant([CarCardData(id: UUID(), make: "", model: "", modelVariant: "", price: 1, color: "", year: 1, mileage: 1, fuelType: "", engineSize: 1.1, enginePower: 1, acceleration: 1.1, gearbox: "", seats: 1, doors: 1, imageName: "", numberOfImages: 1, dateAdded: 1, numberOfOwners: 1, bodyType: "", seller: "", sellerRating: 1.1, description: "", tagline: "", location: "", distance: 1, isLiked: true, recentlyViewed: true)]))
        
    }
}
