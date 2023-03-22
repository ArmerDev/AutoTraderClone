//
//  SlidingGalleryView.swift
//  AutoTraderClone
//
//  Created by James Armer on 23/12/2022.
//

import SwiftUI

struct SlidingGalleryView: View {
    @State private var currentImageIndex = 1
    @State private var fullscreenGalleryPresented = false
    
    var numberOfImages: Int
    let carImageGroup: String
    let carName: String
    let price: Int
    
    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $currentImageIndex) {
                ForEach(1..<(numberOfImages + 1), id: \.self) { num in
                    Image("\(carImageGroup)-\(num)")
                        .resizable()
                        .scaledToFit()
                        .tag(num)
                        .clipped()
                }
            }
            .background(Color("AutoTraderCream"))
            .overlay(alignment: .bottomTrailing, content: {
                Text("\(currentImageIndex) of \(numberOfImages)")
                    .foregroundColor(.white)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 6)
                    .background(.black.opacity(0.65))
                    .cornerRadius(3)
                    .padding(6)
                    .allowsHitTesting(false)
            })
            .frame(width: proxy.size.width, height: proxy.size.height)
            .clipped()
            .onChange(of: currentImageIndex) { value in print("selected tab = \(value)") }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        }
        .aspectRatio(100/75, contentMode: .fit)
        .onTapGesture {
            fullscreenGalleryPresented = true
        }
        .fullScreenCover(isPresented: $fullscreenGalleryPresented) {
            FullscreenGallery(numberOfImages: numberOfImages, currentImageIndex: currentImageIndex, carImageGroup: carImageGroup, carName: carName, price: price)
        }
    }
}

struct SlidingGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingGalleryView(numberOfImages: 13, carImageGroup: "435d-1", carName: "BMW 435d", price: 17240)
    }
}
