//
//  FullscreenGallery.swift
//  AutoTraderClone
//
//  Created by James Armer on 24/12/2022.
//

import SwiftUI

struct FullscreenGallery: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var  scale = 1.0
    @State private var lastScale = 1.0
    @State var currentImageIndex = 1
    @State private var hideControls = false
    @State var refreshState = false
    
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
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.size.width)
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: 300), refresh: $refreshState))
                        .tag(num)
                }
            }
            .overlay(alignment: .bottomTrailing, content: {
                
                
                if hideControls == false {
                    VStack(alignment: .trailing) {
                        Text("\(currentImageIndex) of \(numberOfImages)")
                        Text("\(carName)")
                        Text("\(price.formatted(.currency(code: "GBP")))")
                    }
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 6)
                        .background(.white.opacity(0.25))
                        .cornerRadius(3)
                        .padding(6)
                        .allowsHitTesting(false)
                }
            })
            .overlay(alignment: .topLeading, content: {
                if hideControls == false {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .foregroundColor(.white)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding()
                    }
                }
            })
            .clipped()
            .frame(width: proxy.size.width, height: proxy.size.height)
            .onChange(of: currentImageIndex) { value in
                refreshState.toggle()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        }
        .background(.black)
        .preferredColorScheme(.dark)
        .onTapGesture {
            withAnimation {
                hideControls.toggle()
            }
        }
        .statusBarHidden(hideControls)
    }
}

struct FullscreenGallery_Previews: PreviewProvider {
    static var previews: some View {
        FullscreenGallery(numberOfImages: 5, carImageGroup: "435d-1", carName: "BMW 435d (Digital Media Kit)", price: 17280)
    }
}
