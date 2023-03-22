//
//  DescriptionView.swift
//  AutoTraderClone
//
//  Created by James Armer on 22/12/2022.
//

import SwiftUI

struct DescriptionView: View {
    let carDescription: String
    var body: some View {
        ScrollView {
            Text(carDescription)
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color("AutoTraderGray"))
        .navigationTitle("Description")
        .toolbarBackground(
            Color.white,
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(carDescription: "Hello there")
    }
}
