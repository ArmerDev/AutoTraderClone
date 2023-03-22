//
//  FilterView.swift
//  AutoTraderClone
//
//  Created by James Armer on 27/12/2022.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var modifiableSearchA5: [CarCardData]
    @Binding var searchA5: [CarCardData]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        Spacer()
                        Text("Filter search")
                        Spacer()
                    }
                    
                    HStack {
                        Button("Close") {
                            dismiss()
                        }
                        Spacer()
                    }
                }
                .padding()
                .background(.white)
                
                Divider()
                
                ScrollView {

                        VStackLayout(spacing: 0){
                            Group {
                                FilterViewRow(label: "Postcode", value: "Current location")
                                FilterViewRow(label: "Distance", value: "National")
                                FilterViewRow(label: "Make", value: "All")
                                FilterViewRow(label: "Model", value: "All")
                                FilterViewRow(label: "Model variant", value: "All")
                                FilterViewRow(label: "Only show new car deals", value: "", hasSwitch: true)
                                FilterViewRow(label: "Price type", value: "")
                                FilterViewRow(label: "Price", value: "All")
                               
                            }
                            Group {
                                FilterViewRow(label: "Home delivery", value: "", hasSwitch: true)
                                FilterViewRow(label: "Click & collect", value: "", hasSwitch: true)
                                FilterViewRow(label: "Age", value: "All")
                                FilterViewRow(label: "Year", value: "All")
                                FilterViewRow(label: "Mileage", value: "All")
                                FilterViewRow(label: "Body type", value: "All")
                                FilterViewRow(label: "Fuel type", value: "All")
                                FilterViewRow(label: "Engine size", value: "All")
                                FilterViewRow(label: "Engine power", value: "All")
                            
                            }
                            Group {
                                FilterViewRow(label: "Fuel consumption", value: "All")
                                FilterViewRow(label: "Acceleration", value: "All")
                                FilterViewRow(label: "Gearbox", value: "All")
                                FilterViewRow(label: "Drivetrain", value: "All")
                                FilterViewRow(label: "No. of doors", value: "All")
                                FilterViewRow(label: "Seats", value: "All")
                                FilterViewRow(label: "Colour", value: "All")
                            }
                        }
                }
                .background(Color("AutoTraderGray"))
                
                VStack {
                    HStack {
                        Button {
                            print("reset")
                        } label: {
                            Text("Reset")
                        }
                        
                        Spacer()
                        
                        Text("_ options selected")

                    }
                    .padding()
                    
                    Button {
                        print("search")
                    } label: {
                        Text("Search 000,000 cars")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color("AutoTraderBlue"))
                            .cornerRadius(50)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}
