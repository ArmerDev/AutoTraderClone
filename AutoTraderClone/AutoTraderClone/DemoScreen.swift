//
//  DemoScreen.swift
//  AutoTraderClone
//
//  Created by James Armer on 24/12/2022.
//

import ConfettiSwiftUI
import SwiftUI

struct DemoScreen: View {
    
    @State private var counter: Int = 0
    
    @State private var showSafari: Bool = false
    
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("Clone Challenge")
                .font(.largeTitle)
            
            Text("(Not all features implemented)")
                .font(.footnote)
            
            Group {
                Spacer()
                Spacer()
                Text("""
                    If you like what you see,
                    maybe you'd like to hire me!
                    """)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }

            
            Image("LinkedInImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .shadow(radius: 10)
                .padding(.vertical, 50)
                .confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 225)
                .onAppear {
                    counter += 1
                }
            
            Spacer()
        
            
            Link(destination: URL(string: "https://www.linkedin.com/in/j-armer/")!) {
                Text("View LinkedIn")
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct DemoScreen_Previews: PreviewProvider {
    static var previews: some View {
        DemoScreen()
    }
}
