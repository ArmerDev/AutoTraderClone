//
//  FilterViewRow.swift
//  AutoTraderClone
//
//  Created by James Armer on 28/12/2022.
//

import SwiftUI

struct FilterViewRow: View {
    @State private var switchIsOn: Bool = false
    
    let label: String
    let value: String
    var hasSwitch: Bool = false
    var destination: any View = Text("Hello")
    
    
    var body: some View {

        if hasSwitch {
            VStack(spacing: 0) {
                HStack {
                    Text(label)
                        .layoutPriority(10)
                    Spacer()
                    Toggle("", isOn: $switchIsOn)
                        .tint(Color("AutoTraderTabBlue"))
                }
                .fontWeight(.medium)
                .padding()
                
                Divider()
            }
            .background(Color("AutoTraderGray"))
        } else {
                NavigationLink {
                    Text("New View")
                } label: {
                    VStack(spacing: 0) {
                        HStack {
                            Text(label)
                            Spacer()
                            Text(value)
                                .foregroundColor(value == "All" ? Color.gray : Color("AutoTraderBlue"))
                        }
                        .fontWeight(.medium)
                        .padding()
                        
                        Divider()
                    }
                    .background(Color("AutoTraderGray"))
                }
                .buttonStyle(.plain)
            }
    }
}

struct FilterViewRow_Previews: PreviewProvider {
    static var previews: some View {
        FilterViewRow(label: "Postcode", value: "Current location")
    }
}
