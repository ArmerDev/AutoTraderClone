//
//  Cars.swift
//  AutoTraderClone
//
//  Created by James Armer on 27/01/2023.
//

import Foundation

class Cars: ObservableObject {
    let carsArray: [CarCardData] = Bundle.main.decode("CarJSON.json")!
    @Published var modifiableCarArray = [CarCardData]() {
        
        didSet{
            print("did set occured")
            print(modifiableCarArray)
        }
    }
    
    init() {
        self.modifiableCarArray = carsArray
        print("❌")
    }
    
    func toggleIsLiked(carUUID: UUID) {
        let filterIndex = modifiableCarArray.firstIndex(where: {$0.id == carUUID})
        modifiableCarArray[filterIndex!].isLiked.toggle()
        print("its been toggled")
    }
    
    func checkIsLiked(carUUID: UUID) -> Bool {
        let filterIndex = modifiableCarArray.firstIndex(where: {$0.id == carUUID})
        
        return modifiableCarArray[filterIndex!].isLiked
    }
    
    func amountOfCars(make: String) -> Int {
        let tempArr = modifiableCarArray.filter { $0.make == make}
        return tempArr.count
    }
    
    func filterColours(colour: String) -> [CarCardData] {
        
    let tempArray = modifiableCarArray.filter { $0.color == colour }
        return tempArray
    }
    
    
}
