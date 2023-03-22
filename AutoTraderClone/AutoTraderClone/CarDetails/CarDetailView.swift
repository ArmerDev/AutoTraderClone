//
//  CarDetailView.swift
//  AutoTraderClone
//
//  Created by James Armer on 21/12/2022.
//

import SwiftUI

struct CarDetailView: View {
    
    @EnvironmentObject var recentArray: RecentlyViewed
    @EnvironmentObject var modify: Cars
    
    let carUUID: UUID
    let carImageName: String
    let carNumberOfImages: Int
    let carMake: String
    let carModel: String
    let carTagline: String
    let carPrice: Int
    let carMileage: Int
    let carBodyType: String
    let carEngineSize: Double
    let carGearbox: String
    let carFuelType: String
    let carDoors: Int
    let carSeats: Int
    let carNumberOfOwners: Int
    let carDescription: String
    let carSeller: String
    let carSellerRating: Double
    
    @StateObject var modiarr = Cars()

    var body: some View {
       
            VStack {
                ScrollView {
                    VStack {
                        // Name and Price section
                        Group {
                                SlidingGalleryView(numberOfImages: carNumberOfImages, carImageGroup: carImageName, carName: "\(carMake) \(carModel)", price: carPrice)
                            
                            HStack{
                                VStack(alignment: .leading) {
                                    Text("Used")
                                        .font(.caption)
                                        .padding(.bottom, 1)
                                    Text("\(carMake) \(carModel)")
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 1)
                                    Text(carTagline)
                                        .font(.caption)
                                }
                                
                                Spacer()
                            }
                            .padding()
                            
                            HStack {
                                Text(carPrice.formatted(.currency(code: "GBP")))
                                    .font(.title)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.1))
                                .frame(height: 1)
                                .padding(.horizontal)
                        }
                        .task {
                            recentArray.insert(value: carUUID)
                        }
                        
                        //Overview and Description section
                        Group {
                            HStack {
                                Text("Overview")
                                    .fontWeight(.semibold)
                                    .padding()
                                Spacer()
                            }
                            
                            CarStats(mileage: carMileage, typeOfCar: carBodyType, engineSize: "\(carEngineSize)L", gearBox: carGearbox, fuelType: carFuelType, doors: carDoors, seats: carSeats, numberOfOwners: carNumberOfOwners)
                            
                            Spacer()
                            
                            HStack {
                                Text("Description")
                                    .fontWeight(.semibold)
                                    .padding()
                                Spacer()
                            }
                            
                            VStack(alignment: .leading) {
                                ZStack {
                                    
                                    Text(carDescription)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .font(.caption)
                                    
                                    LinearGradient(colors: [Color.white, Color.clear], startPoint: .bottom, endPoint: .top)
                                }

                                NavigationLink {
                                    DescriptionView(carDescription: carDescription)
                                    
                                    
                                } label: {
                                    Text("View more \(Image(systemName: "arrow.forward"))")
                                        .font(.callout)
                                        .foregroundColor(Color("AutoTraderBlue"))
                                }
                                
                            }
                            .padding(.horizontal)
                            
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.3))
                                .frame(height: 1)
                                .padding(.leading, 15)

                        }

                        //Specification, Running Costs and History section
                        Group {
                            VStack (spacing: 0) {
                                //Specification
                                NavigationLink {
                                    DemoScreen()
                                } label: {
                                    VStack {
                                        HStack {
                                            Image("specIcon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30)
                                                .padding(.trailing, 5)
                                            Text("Specification")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                        .accentColor(.black)
                                        .padding()
                                    
                                    Rectangle()
                                        .foregroundColor(.gray.opacity(0.3))
                                        .frame(height: 1)
                                        .padding(.leading, 15)
                                    }
                                }
                                .buttonStyle(DetailedViewButtonStyle())
                                
                                //Running costs
                                NavigationLink {
                                    DemoScreen()
                                } label: {
                                    VStack {
                                        HStack {
                                            Image("calcIcon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30)
                                                .padding(.trailing, 5)
                                            Text("Running costs")
                                                .fontWeight(.semibold)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                        .accentColor(.black)
                                        .padding()
                                        
                                        
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.3))
                                            .frame(height: 1)
                                            .padding(.leading, 15)
                                    }
                                }
                                .buttonStyle(DetailedViewButtonStyle())
                                
                                //Meerkat Section
                                NavigationLink {
                                    DemoScreen()
                                } label: {
                                    VStack {
                                        HStack {
                                            Image("MeerkatIcon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60)
                                                .padding(.trailing, 5)
                                            VStack(alignment: .leading) {
                                                Text("How much is it to insure?")
                                                    .fontWeight(.semibold)
                                                
                                                Text("""
                                                    Compare insurance quotes for this
                                                    car through Compare The Market
                                                    """)
                                                .lineLimit(2)
                                            }
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                        .accentColor(.black)
                                        .padding()
                                        
                                        
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.3))
                                            .frame(height: 1)
                                            .padding(.leading, 15)
                                    }
                                }
                                .buttonStyle(DetailedViewButtonStyle())
                                
                                //Basic History
                                NavigationLink {
                                    DemoScreen()
                                } label: {
                                    VStack {
                                        HStack {
                                            Image("checksIcon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30)
                                                .padding(.trailing, 5)
                                            VStack(alignment: .leading) {
                                                Text("Basic history check")
                                                    .fontWeight(.semibold)
                                                Text("Status: 5 checks passed")
                                                    .font(.caption)
                                            }
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                        .accentColor(.black)
                                        .padding()
                                        
                                        Rectangle()
                                            .foregroundColor(.gray.opacity(0.1))
                                            .frame(height: 1)
                                            .padding(.leading, 15)
                                    }
                                }
                                .buttonStyle(DetailedViewButtonStyle())

                            }
                        }
                        .padding(.top, -8)
                        
                        HStack {
                            Text("About this seller")
                                .fontWeight(.medium)
                                .padding()
                            Spacer()
                        }
                        
                        HStack {
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: .init(colors: [.gray, .black, .gray]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                    ))
                                .frame(width: 300, height: 50)
                            Spacer()
                        }
                        .padding(.leading, 15)
                        
                    
                        HStack {
                            Text(carSeller)
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        
                        HStack {
                            FiveStarView(rating: Decimal(carSellerRating), color: Color("OrangeStar"), backgroundColor: Color("OrangeStarBackground"))
                                .frame(width: 150)
                                
                            
                            Text("\(carSellerRating, specifier: "%.1f")")
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal)

                        HStack {
                            VStack {
                                Image(systemName: "envelope")
                                    .padding(.vertical, 5)
                                Group {
                                    Text("Email")
                                    Text("seller")
                                }
                                .font(.footnote)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName: "arrow.up.forward.app")
                                    .padding(.vertical, 5)
                                Group {
                                    Text("Visit")
                                    Text("website")
                                }
                                .font(.footnote)
                                
                            }
                            Spacer()
                            
                            VStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .padding(.vertical, 5)
                                Group {
                                    Text("Location")
                                    Text("map")
                                }
                                .font(.footnote)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName: "arrow.triangle.turn.up.right.diamond")
                                    .padding(.vertical, 5)
                                Group {
                                    Text("Get")
                                    Text("directions")
                                }
                                .font(.footnote)
                            }
                        }
                        .fontWeight(.medium)
                        .foregroundColor(Color("AutoTraderBlue"))
                        .padding(.vertical)
                        .padding(.top, 15)
                        .padding(.horizontal, 50)
                        
                        
                        SellerExtras()
                            .padding(.bottom, 10)
                        
                        BottomOfDetailView()
                            .padding(.horizontal)

                    }
                    .toolbar {

                        Button {
                            modify.toggleIsLiked(carUUID: carUUID)
                        } label: {
                            Image(systemName: modify.checkIsLiked(carUUID: carUUID) ? "heart.fill": "heart")
                                .foregroundColor(.red)
   
                        }

                        Button(action: { }) {
                            Image(systemName: "arrow.left.arrow.right")
                                
                        }
                        Button(action: { }) {
                            Image(systemName: "square.and.arrow.up")
                                
                        }
                    }
                }
                
                VStack {
                    
                    Divider()
                        .padding(.top, -7)
                
                    HStack(spacing: 10) {
                        Button {
                            print("Call seller pressed")
                        } label: {
                            Text("Call Seller")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("AutoTraderBlue"))
                                .cornerRadius(50)
                        }
                        
                        Button {
                            print("Call seller pressed")
                        } label: {
                            Text("Email Seller")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("AutoTraderBlue"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color("AutoTraderBlue"), lineWidth: 1)
                                        )
                        }

                    }
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                }
            }
        
    }
}

struct SellerExtras: View {
    var body: some View {
        Group {
            VStack (spacing: 0) {
                //Specification
                NavigationLink {
                    DemoScreen()
                } label: {
                    VStack {
                        HStack {
                            Text("More about this seller")
                                .fontWeight(.medium)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .accentColor(.black)
                        .padding()
                        
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(height: 1)
                            .padding(.leading, 15)
                    }
                }
                .buttonStyle(DetailedViewButtonStyle())
                
                //Running costs
                NavigationLink {
                    DemoScreen()
                } label: {
                    VStack {
                        HStack {
                            
                            Text("More cars from this seller")
                                .fontWeight(.medium)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .accentColor(.black)
                        .padding()

                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(height: 1)
                            .padding(.leading, 15)
                    }
                }
                .buttonStyle(DetailedViewButtonStyle())
            }
        }
        
        HStack {
            Text("Details")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            
        }
        .padding(.horizontal)
        
        Group {
            VStack (spacing: 0) {
                //Specification
                NavigationLink {
                    DemoScreen()
                } label: {
                    VStack {
                        HStack {
                            Text("This car comes with")
                                .fontWeight(.medium)
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .accentColor(.black)
                        .padding()
                        
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(height: 1)
                            .padding(.leading, 15)
                    }
                }
                .buttonStyle(DetailedViewButtonStyle())
                
                //Running costs
                NavigationLink {
                    DemoScreen()
                } label: {
                    VStack {
                        HStack {
                            
                            Text("Owner ratings (395) ")
                                .fontWeight(.medium)
                            FiveStarView(rating: 4.3, color: Color("GreenStar"), backgroundColor: Color("GreenStarBackground"))
                                .frame(width: 125, height: 15)
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .accentColor(.black)
                        .padding()
                        
                        
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(height: 1)
                            .padding(.leading, 15)
                    }
                }
                .buttonStyle(DetailedViewButtonStyle())
                
                //Running costs
                NavigationLink {
                    DemoScreen()
                } label: {
                    VStack {
                        HStack {
                            
                            Text("Report this advert")
                                .fontWeight(.medium)
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .accentColor(.black)
                        .padding()
                        
                    }
                }
                .buttonStyle(DetailedViewButtonStyle())
            }
        }

    }
}

struct BottomOfDetailView: View {
    let headerText = "We're dedicated to providing you with the tools you need for a hassle-free experience. From car history checks and scams to be aware of, to our top tips to stay safe online. Use our guides to buy and sell a car with confidence."
    
    var body: some View {

        HStack {
            Image("SafetySecurity")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .padding(.trailing, 5)
            Text("Safety and security centre")
            Spacer()
        }
        HStack {
            Text(headerText)
                .font(.subheadline)
            Button {
                //not implemented
            } label: {
                Text("Read more")
            }

        }
        
        
        Group {
            VStack(alignment: .leading) {
                Text("Specifications")
                    .fontWeight(.bold)
                Text("The data displayed above details the usual specification of the most recent model of this vehicle. It is not the exact data for the actual vehicle being offered for sale and data for older models may vary slightly. We recommend you check the vehicle details with the seller before you buy.")
            }
            .padding(.top, 5)
            
            VStack(alignment: .leading) {
                Text("Insurance categories")
                    .fontWeight(.bold)
                Text("We use data from the Motor Insurance Anti-Fraud and Theft Register (MIAFTR) to check whether the vehicle was recorded as being written off as part of an insurance total loss claim at the time the advert was placed. We provide write-off category labels (Cat C/D/S/N) for your assistance, but the presence or absence of a label does not guarantee the vehicle's status. Data can change, so you are strongly advised to obtain a full vehicle history check before making an offer on a vehicle.")
            }
            .padding(.top, 5)
            
           
            
            VStack(alignment: .leading) {
                Text("Vehicle checks")
                    .fontWeight(.bold)
                Text("Vehicle checks are provided by Auto Trader (using data provided by Experian) for information only and to the extent permitted by law. Neither Auto Trader nor Experian will be liable for any inaccuracies or for any loss you suffer if you reply on it as detailed in our terms of use.")
                // terms of use should be a button
                
                Text("Copyright © Auto Trader Limited 2023. Auto Trader is authorised and regulated by the Financial Conduct Authority in relation to consumer credit and insurance mediation activities. Our FCA firm number is 735711.")
                    .padding(.top, 5)
                    .padding(.bottom, 15)
            }
            .padding(.top, 5)
        }
        .font(.footnote)
    }
}


struct DetailedViewButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .background(configuration.isPressed ? Color("AutoTraderGray") : Color.white)

  }

}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(carUUID: UUID(uuidString: "D6C6F715-5A4B-4500-8E00-2528614C812D")!, carImageName: "Zoe", carNumberOfImages: 4, carMake: "BMW", carModel: "4 Series", carTagline: "Beautiful example", carPrice: 14923, carMileage: 123999, carBodyType: "Coupe", carEngineSize: 2.0, carGearbox: "Automatic", carFuelType: "Petrol", carDoors: 2, carSeats: 4, carNumberOfOwners: 1, carDescription: "Lovely example", carSeller: "Prestige Cars", carSellerRating: 3.2)
    }
}


