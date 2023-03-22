//
//  CarStats.swift
//  AutoTraderClone
//
//  Created by James Armer on 22/12/2022.
//

import SwiftUI

struct CarStats: View {
    let mileage: Int
    let typeOfCar: String
    let engineSize: String
    let gearBox: String
    let fuelType: String
    let doors: Int
    let seats: Int
    let numberOfOwners: Int
    
    var body: some View {
        VStack {
            HStack {
                //Millage
                HStack {
                    Image("Mileage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35)
                        .padding(.leading, -3)
                        
                    Text("\(mileage.formatted()) miles")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 3)
                    Spacer()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal, 2)
            .padding(.bottom, 10)
            
            if fuelType == "Electric"{
                HStack {
                    //Car type
                    HStack {
                        Image("CarType")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text(typeOfCar)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Gearbox
                    HStack {
                        if gearBox == "Manual" {
                            Image("Gearbox")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                        } else {
                            Image("Automatic")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                        }
                            
                        Text(gearBox)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
                
                HStack {
                    //Fuel Type
                    HStack {
                        Image("ElectricFuelType")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text(fuelType)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Number of Doors
                    HStack {
                        Image("Door")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text("\(doors) doors")
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
                
                HStack {
                    //Seats
                    HStack {
                        Image("Seats")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text("\(seats) seats")
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Owners
                    HStack {
                        Image("Owner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text("\(numberOfOwners) owners")
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
                
                
            } else {
                HStack {
                    //Car type
                    HStack {
                        Image("CarType")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text(typeOfCar)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Engine
                    HStack {
                        Image("EngineSize")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text(engineSize)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
                
                HStack {
                    //Gearbox
                    HStack {
                        if gearBox == "Manual" {
                            Image("Gearbox")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                        } else {
                            Image("Automatic")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                        }
                            
                        Text(gearBox)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Fuel Type
                    HStack {
                        
                        Image("FuelType")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        
                        Text(fuelType)
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
                
                HStack {
                    //Number of Doors
                    HStack {
                        Image("Door")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text("\(doors) doors")
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    //Seats
                    HStack {
                        Image("Seats")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text("\(seats) seats")
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
                
                HStack {
                    //Owners
                    HStack {
                        Image("Owner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        Text("\(numberOfOwners) owners")
                            .font(.subheadline)
                            .padding(.horizontal, 3)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.horizontal, 2)
                .padding(.bottom, 10)
            }
        }
    }
}

struct CarStats_Previews: PreviewProvider {
    static var previews: some View {
        CarStats(mileage: 100000, typeOfCar: "Hatchback", engineSize: "6L", gearBox: "Automatic", fuelType: "Electric", doors: 2, seats: 4, numberOfOwners: 3)
    }
}
