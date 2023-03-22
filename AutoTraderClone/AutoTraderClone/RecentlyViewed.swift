//
//  RecentlyViewed.swift
//  AutoTraderClone
//
//  Created by James Armer on 25/01/2023.
//

import Foundation


class RecentlyViewed: ObservableObject {
    @Published var recentlyViewedCars = [UUID]() {
        didSet {
            print("did set occured")
            print(recentlyViewedCars)
        }
    }
    
    func insert(value: UUID) {
   
        if recentlyViewedCars.count < 1 {
            recentlyViewedCars.insert(value, at: 0)
        }

        if recentlyViewedCars.count < 8 {
            recentlyViewedCars.removeAll { v in
                return v == value
            }
            recentlyViewedCars.insert(value, at: 0)
        } else {
            recentlyViewedCars.removeAll { v in
                return v == value
            }
            if recentlyViewedCars.count >= 8 {
                recentlyViewedCars.removeLast()
            }
            recentlyViewedCars.insert(value, at: 0)
        }
    }
}
