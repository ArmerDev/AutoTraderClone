//
//  AutoTraderCloneApp.swift
//  AutoTraderClone
//
//  Created by James Armer on 21/12/2022.
//

import SwiftUI

@main
struct AutoTraderCloneApp: App {
    
    @StateObject var rcntViewed = RecentlyViewed()
    @StateObject var modifyArr = Cars()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(rcntViewed)
                .environmentObject(modifyArr)
                
                
        }
    }
}
