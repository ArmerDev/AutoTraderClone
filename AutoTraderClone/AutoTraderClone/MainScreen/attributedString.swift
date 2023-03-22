//
//  attributedString.swift
//  AutoTraderClone
//
//  Created by James Armer on 24/01/2023.
//

import SwiftUI


struct ContentView2: View {
    var message: AttributedString {
        var result = AttributedString("Learn Swift here")
                result.font = .largeTitle
        let range = result.range(of: "Swift")
        result[range!].link = URL(string: "https://www.hackingwithswift.com")
                return result
    }

    var body: some View {
        Text(message)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
