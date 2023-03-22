//
//  SearchCard.swift
//  AutoTraderClone
//
//  Created by James Armer on 21/12/2022.
//

import SwiftUI

struct SearchCard: View {

    @Binding var arrayOfTupes: [RecentlySearchedVehicles]
    @Binding var arrayOfRecentlyViewed: [UUID]
    @Binding var showSearchOptions: Bool
    
    @State var searchArray: [CarCardData]
    @State private var selectedMake = ""
    @State private var selectedModel = ""
    @State private var scale = 0.5
    @State private var showOptions = false
    @State private var sortedBy = ""
    @State var make: String
    @State var model: String
    
    var carMakes: [String] {
        let tempMakesSet: Set<String> = Set(searchArray.map { $0.make })
        var makes: [String] = Array(tempMakesSet)
        makes.insert("All", at: 0)
        return makes.sorted { $0 < $1 }
    }
    
    var carModels: [String] {
        let tempArray = searchArray.filter { $0.make == selectedMake}
        let tempModelSet: Set<String> = Set(tempArray.map { $0.model})
        var models: [String] = Array(tempModelSet)
        models.insert("All", at: 0)
        return models.sorted { $0 < $1 }
    }

    let sortOptions = ["Price (Lowest)", "Price (Highest)", "Distance", "Mileage", "Age (Newest first)", "Age (Oldest first)", "Most recent"]
    

    var body: some View {
        VStack(alignment: .leading) {
            Text("Find your perfect car")
                .fontWeight(.semibold)
            
            NavigationLink {
                CustomListWithAlphabet(selection: $selectedMake, carsArray: carMakes, showingSideScroller: true, withNumbers: true)
            } label: {
                ZStack{
                    Text(selectedMake == "" ? "Select Make" : selectedMake.uppercased())
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AutoTraderTextField"))
                        .cornerRadius(10)
                        .onChange(of: selectedMake) { newValue in
                            selectedModel = ""
                        }
                    
                    VStack {
                        HStack {
                            Text(selectedMake == "" ? "" : "Make")
                                .foregroundColor(.black)
                                .font(.caption)
                                .padding(10)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .padding(.bottom, 5)
            }

            if selectedMake == "" {
                
                ZStack {
                    Text(selectedModel == "" ? "Select Model" : selectedModel.uppercased())
                        .fontWeight(.medium)
                        .foregroundColor(Color("AutoTraderTextFieldDisabledText"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AutoTraderTextFieldDisabled"))
                        .cornerRadius(10)
                    
                    VStack {
                        HStack {
                            Text(selectedModel == "" ? "" : "Model")
                                .foregroundColor(.black)
                                .font(.caption)
                                .padding(10)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .padding(.bottom, 5)
            } else {
                NavigationLink {
                    CustomListWithAlphabet(selection: $selectedModel, carsArray: carModels, showingSideScroller: false, withNumbers: false)
                } label: {
                    ZStack {
                        Text(selectedModel == "" ? "Select Model" : selectedModel.uppercased())
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("AutoTraderTextField"))
                            .cornerRadius(10)
                        
                        VStack {
                            HStack {
                                Text(selectedModel == "" ? "" : "Model")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(10)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .padding(.bottom, 5)
                }
                
                
            }
            
            HStack {
                Button {
                    selectedMake = ""
                    selectedModel = ""
                } label: {
                    Text("\(Image(systemName: "arrow.clockwise")) Reset")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                Button {
                    showSearchOptions.toggle()
                } label: {
                    Text("More Options")
                        .font(.caption)
                        .fontWeight(.medium)
                }
            }
            .foregroundColor(Color("AutoTraderBlue"))
            
            NavigationLink {
                VStack {
                    ScrollView {
                        HStack {
                            if selectedMake == "" {
                                Text("\(searchArray.count) cars found")
                            } else if selectedMake != "" && selectedModel != "" {
                                Text("\(searchArray.filter {$0.make == selectedMake}.filter {$0.model == selectedModel}.count) cars found")
                            } else if selectedMake != "" && selectedModel == "" {
                                Text("\(searchArray.filter {$0.make == selectedMake}.count) cars found")
                            }
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
                                print("sort")
                            } label: {
                                Text("\(Image(systemName: "slider.horizontal.3")) Options")
                            }
                        }
                        .padding()
                        
                        if selectedMake != "" && selectedModel == "" {
                            VStack {
                                ForEach(searchArray.filter { $0.make == selectedMake}.sorted {
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
                                    ListRow(arrayOfRecentlyViewed: $arrayOfRecentlyViewed, carUUID: data.id ,carImageName: data.imageName, carMake: data.make, carModel: data.model, carTagline: data.tagline, carPrice: data.price, carYear: data.year, carMileage: data.mileage, carNumberOfImages: data.numberOfImages, carBodyType: data.bodyType, carEngineSize: data.engineSize, carIsLiked: data.isLiked, carFuelType: data.fuelType, carGearbox: data.gearbox, carDoors: data.doors, carSeats: data.seats, carNumberOfOwners: data.numberOfOwners, carDescription: data.description, carSeller: data.seller, carSellerRating: data.sellerRating, location: data.location, distance: data.distance)
                                }
                            }
                            .background(Color("AutoTraderGray"))
                        } else if selectedMake != "" && selectedModel != "" {
                            VStack {
                                ForEach(searchArray.filter { $0.model == selectedModel}.sorted {
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
                            .background(Color("AutoTraderGray"))
                        } else {
                            VStack {
                                ForEach(searchArray.sorted {
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
                            .background(Color("AutoTraderGray"))
                        }
                    }
                }
                .onAppear{
                    if selectedMake != "" && selectedModel != "" {
                        
                        if arrayOfTupes.count < 1 {
                            arrayOfTupes.insert(RecentlySearchedVehicles(make: selectedMake, model: selectedModel), at: 0)
                        } else if arrayOfTupes.count < 3 {
                            arrayOfTupes.removeAll { value in
                                return value == RecentlySearchedVehicles(make: selectedMake, model: selectedModel)
                            }
                            arrayOfTupes.insert(RecentlySearchedVehicles(make: selectedMake, model: selectedModel), at: 0)
                        } else {
                            arrayOfTupes.removeAll { value in
                                return value == RecentlySearchedVehicles(make: selectedMake, model: selectedModel)
                            }
                            arrayOfTupes.removeLast()
                            arrayOfTupes.insert(RecentlySearchedVehicles(make: selectedMake, model: selectedModel), at: 0)
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
            } label: {
                if selectedMake == "" {
                    Text("\(Image(systemName: "magnifyingglass")) Search \(searchArray.count) cars")
                        .scaleEffect(scale)
                        .animation(.easeIn, value: scale)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                } else if selectedMake != "" && selectedModel != "" {
                    Text("\(Image(systemName: "magnifyingglass")) Search \(searchArray.filter {$0.make == selectedMake}.filter {$0.model == selectedModel}.count) cars")
                        .scaleEffect(scale)
                        .animation(.easeIn, value: scale)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                } else if selectedMake != "" && selectedModel == "" {
                    Text("\(Image(systemName: "magnifyingglass")) Search \(searchArray.filter {$0.make == selectedMake}.count) cars")
                        .scaleEffect(scale)
                        .animation(.easeIn, value: scale)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(Color("AutoTraderBlue"))
            .cornerRadius(50)
        }
        .padding()
        .background(Color("AutoTraderSearchBox"))
        .cornerRadius(10)
        .padding()
        .shadow(color: .gray.opacity(0.3),radius: 3)
        .onAppear {
            scale = 0.5
            DispatchQueue.main.async {
                scale = 1
            }
        }
    }
}
