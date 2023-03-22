//
//  RecentlyViewed.swift
//  AutoTraderClone
//
//  Created by James Armer on 28/12/2022.
//

import Foundation

struct CarCardData: Codable, Identifiable {
    
    let id: UUID
    let make: String
    let model: String
    let modelVariant: String
    let price: Int
    let color: String
    let year: Int
    let mileage: Int
    let fuelType: String
    let engineSize: Double
    let enginePower: Int
    let acceleration: Double
    let gearbox: String
    let seats: Int
    let doors: Int
    let imageName: String
    let numberOfImages: Int
    let dateAdded: Int
    let numberOfOwners: Int
    let bodyType: String
    let seller: String
    let sellerRating: Double
    let description: String
    let tagline: String
    let location: String
    let distance: Int
    var isLiked: Bool
    let recentlyViewed: Bool

}
