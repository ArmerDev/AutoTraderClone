//
//  ContentView.swift
//  AutoTraderClone
//
//  Created by James Armer on 21/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 0
    init() {
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.init(Color.white)
            UITabBar.appearance().standardAppearance = tabBarAppearance
        
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    
                    if selection == 0 {
                            Label("Home", image: "HomeFill")

                        } else {
                            Label("Home", image: "Home")
                        }
                    
                }
                .tag(0)
            
            DemoScreen()
                .tabItem {
                    if selection == 1 {
                        Label("Search", image: "SearchFill")
                    } else {
                        Label("Search", image: "Search")
                    }
                }
                .tag(1)
            
            
            DemoScreen()
                .tabItem {
                    if selection == 2 {
                            Label("Sell", image: "SellFill")
                        } else {
                            Label("Sell", image: "Sell")
                        }
                }
                .tag(2)
            
            
            DemoScreen()
                .tabItem {
                    if selection == 3 {
                        Label("Saved", image: "SavedFill")
                    } else {
                        Label("Saved", image: "Saved")
                    }
                }
                .tag(3)
            
            DemoScreen()
                .tabItem {
                    if selection == 4 {
                        Label("Account", image: "AccountFill")
                    } else {
                        Label("Account", image: "Account")
                    }
                }
                .tag(4)
        }
        .accentColor(Color("AutoTraderTabBlue"))
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let rv = RecentlyViewed()
    static let c = Cars()
    static var previews: some View {
        ContentView()
            .environmentObject(rv)
            .environmentObject(c)
    }
}
