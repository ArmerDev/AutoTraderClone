//
//  HomeView.swift
//  AutoTraderClone
//
//  Created by James Armer on 25/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var recentArray: RecentlyViewed
    @Environment(\.dismiss) var dismiss

    @State var arrayOfRecentlyViewed = [UUID]()
    @State var arrayOfRecentlySearchedMakeAndModels = [RecentlySearchedVehicles]()
    @State private var make: String = ""
    @State private var model: String = ""
    @State var carsArray: [CarCardData] = Bundle.main.decode("CarJSON.json")!
    @State var modifiableCarArray: [CarCardData] = []
    @State private var showSearchOptions = false
    @State private var showOptions = false
    @State private var sortedBy = ""
    @State var testingAnimation = false
    
    let popularBodyTypes = ["Hatchback", "SUV", "Saloon", "Estate", "Coupe", "Convertible", "MPV", "Pickup"]
    let sortOptions = ["Price (Lowest)", "Price (Highest)", "Distance", "Mileage", "Age (Newest first)", "Age (Oldest first)", "Most recent"]

    var body: some View {
        NavigationStack {
            VStack {
                
                // Header
                VStack {
                    Image("AutoTraderLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 175)
                        .padding(.top)
                    
                    // Vehicle Type ScrollView
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Image("car")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .frame(width: 70)
                                .border(width: 2, edges: [.bottom], color: .black)
                            Image("motorbike")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                            Image("van")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                            Image("campervan")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                            Image("lorry")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                            Image("caravan")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                            Image("truck")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                            Image("tractor")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color("AutoTraderDarkGray"))
                                .frame(width: 70)
                        }
                    }
                }
                .padding(.bottom, -7)
                .background(Color("AutoTraderHeader"))
                .onAppear {
                    withAnimation {
                        testingAnimation.toggle()
                    }
                }
                
                
                //Main Section
                ScrollView {
                    
                    //Search Area
                    SearchCard(arrayOfTupes: $arrayOfRecentlySearchedMakeAndModels, arrayOfRecentlyViewed: $arrayOfRecentlyViewed, showSearchOptions: $showSearchOptions, searchArray: carsArray, make: make, model: model)
                        .sheet(isPresented: $showSearchOptions) {
                            FilterView(modifiableSearchA5: $modifiableCarArray, searchA5: $carsArray)
                        }
                    
                    

                    if recentArray.recentlyViewedCars.count != 0 {
                        HomeScreenRecentRow(modifiableCarArray: $modifiableCarArray)
                    }

                    ForEach(arrayOfRecentlySearchedMakeAndModels, id: \.self) { car in
                        
                        HomeScreenRow(modifyCarArray: $modifiableCarArray, arrayOfRecentlyViewed: $arrayOfRecentlyViewed, sortedBy: $sortedBy, showOptions: $showOptions, carsArray: $carsArray, selectedModel: car.model, homeRowHeading: "\(car.make) \(car.model)")
                    
                    }
                    

                    // Popular Body Types
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text("Popular body types")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Spacer()

                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            Spacer(minLength: 3)
                            
                            HStack {
                                Spacer(minLength: 16)
                                
                                ForEach(popularBodyTypes, id: \.self) { car in

                                    NavigationLink {
                                        VStack {
                                            ScrollView {
                                                                                        
                                                HStack {
                                                    Text("\(carsArray.filter {$0.bodyType == car}.count) cars found")
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
                                                
                                                VStack {
                                                    ForEach(modifiableCarArray.filter{$0.bodyType == car}.sorted {
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
                                        .toolbar {
                                            Button {
                                                print("Save Search")
                                            } label: {
                                                Text("Save Search")
                                            }

                                        }
                                        .sheet(isPresented: $showOptions) {
                                            FilterView(modifiableSearchA5: $modifiableCarArray, searchA5: $carsArray)
                                                .navigationTitle("Hello")
                                        }
                                        
                                    } label: {
                                        PopularBodyCarCard(imageName: car, bodyType: car, numberOfVehiclesInBodyType: carsArray.filter{$0.bodyType == car}.count)

                                    }
                                    .buttonStyle(NonHighlightingButton())
                                    .onAppear {
                                        modifiableCarArray = carsArray
                                    }
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
                .background(Color("AutoTraderBackground"))
            }
        }
        .accentColor(Color("AutoTraderBlue"))
    }
}

struct NoTapEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
