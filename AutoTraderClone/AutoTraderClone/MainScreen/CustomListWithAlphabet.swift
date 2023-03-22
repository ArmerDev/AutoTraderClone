//
//  CustomListWithAlphabet.swift
//  AutoTraderClone
//
//  Created by James Armer on 18/01/2023.
//

import SwiftUI

struct CustomListWithAlphabet: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modify: Cars

    @GestureState private var dragLocation: CGPoint = .zero
    
    @Binding var selection: String
    
    @State var carsArray: [String]
    @State var showingSideScroller: Bool
    @State var groupedArrayOfMakes: [String: [String]] = [:]
    @State private var dragPossible = false
    @State private var scrollTarget = ""
    @State private var scrollWithAnimation = true
    
    let withNumbers: Bool
    
    var body: some View {
        
            ZStack {
                VStack {
                    Rectangle()
                        .foregroundColor(Color("ExtraLightGray"))
                        .frame(height: 35)
                    Spacer()
                }
                HStack(spacing: 0) {
                    
                        ScrollViewReader { proxy in
                            List {
                                ForEach(groupedArrayOfMakes.keys.sorted(by: { (key1, key2) -> Bool in
                                    if key1.starts(with: "#") && !key2.starts(with: "#") {
                                            return false
                                        } else if !key1.starts(with: "#") && key2.starts(with: "#") {
                                            return true
                                        } else {
                                            return key1 < key2
                                        }
                                }), id: \.self) {key in
                                    Section(header: HStack {
                                        Text(key)
                                            .foregroundColor(.black)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 20)
                                        Spacer()
                                        }
                                        .background(Color("LightGray"))
                                        .listRowInsets(EdgeInsets(
                                                top: 0,
                                                leading: 0,
                                                bottom: 0,
                                                trailing: 0))) {
                                                    ForEach(groupedArrayOfMakes[key]!.sorted(by: { (element1, element2) -> Bool in
                                                        if element1 == "All" {
                                                            return true
                                                        } else {
                                                            return false
                                                        }
                                                    }), id: \.self) {value in
                                            Button {
                                                if value == "All" {
                                                    selection = ""
                                                } else {
                                                    selection = value
                                                }
                                                dismiss()
                                            } label: {
                                                HStack{
                                                    Text(value == "All" ? value : value.uppercased())
                                                        .fontWeight(.medium)
                                                    Spacer()
                                                    
                                                    if withNumbers {
                                                        if value != "All" {
                                                            Text("\(modify.amountOfCars(make: value))")
                                                                .padding(5)
                                                                .foregroundColor(.gray)
                                                                .background(Color("LightGray"))
                                                                .cornerRadius(5)
                                                        }
                                                    }
                                                }
                                            }

                                        }
                                    }
                                }
                            }
                            .scrollIndicators(scrollWithAnimation ? .visible : .hidden)
                            .listStyle(.plain)
                            .onChange(of: scrollTarget) { newValue in
                                
                                if scrollWithAnimation {
                                    withAnimation {
                                        proxy.scrollTo(newValue, anchor: .top)
                                    }
                                } else {
                                    //without animation
                                    proxy.scrollTo(newValue, anchor: .top)
                                }
                                print(newValue)
                            }
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    scrollTarget = ""
                                    dragPossible = true
                                }
                            }
                    }
                    
                    if showingSideScroller {
                        ZStack {
                            Rectangle()
                                .ignoresSafeArea(edges: .bottom)
                                .foregroundColor(Color("LightGray"))
                                .frame(width: 45)
                            
                            VStack {
                                ForEach(groupedArrayOfMakes.keys.sorted(by: { (key1, key2) -> Bool in
                                    if key1.starts(with: "#") && !key2.starts(with: "#") {
                                            return false
                                        } else if !key1.starts(with: "#") && key2.starts(with: "#") {
                                            return true
                                        } else {
                                            return key1 < key2
                                        }
                                }), id: \.self) {key in
                                    Text(key)
                                        .foregroundColor(.black)
                                        .frame(width: 40)
                                        .background(dragObserver(title: key))
                                        .gesture(
                                            TapGesture()
                                                .onEnded { _ in
                                                    scrollWithAnimation = true
                                                    scrollTarget = key
                                                }
                                        )
                                    Spacer()
                                    
                                }
                            }
                            .padding([.top, .bottom], 10)
                            .gesture(
                                  DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                    .updating($dragLocation) { value, state, _ in
                                      state = value.location
                                    }
                                    .onEnded({ _ in
                                        scrollWithAnimation = true
                                    })
                                )
                        }
                    }
                }
                .navigationTitle("Makes")
                .navigationBarTitleDisplayMode(.inline)
            }
        .onAppear {
            
            groupedArrayOfMakes = Dictionary(
                grouping: carsArray,
                by: {$0.first?.uppercased() ?? ""}
            ).mapValues{$0.sorted()}
            
            var seriesArray = [String]()
            for (key, value) in groupedArrayOfMakes {
                if key == "1" || key == "2" || key == "3" || key == "4" || key == "5" || key == "6" || key == "7" || key == "8" || key == "9" || key == "0" {
                    seriesArray += value
                }
            }
            
            if seriesArray.count > 0 {
                groupedArrayOfMakes["#"] = seriesArray.sorted()
                
                for i in 0...9 {
                    groupedArrayOfMakes.removeValue(forKey: "\(i)")
                }
            }
        }
    }
    
    func dragObserver(title: String) -> some View {
        GeometryReader { geometry in
          dragObserver(geometry: geometry, title: title)
        }
      }
    
    // This function is needed as view builders don't allow to have
      // pure logic in their body.
      private func dragObserver(geometry: GeometryProxy, title: String) -> some View {
        if geometry.frame(in: .global).contains(dragLocation) {
          // we need to dispatch to the main queue because we cannot access to the
          // `ScrollViewProxy` instance while the body is rendering
          DispatchQueue.main.async {
              if dragPossible == true {
                  scrollWithAnimation = false
                      scrollTarget = title
              }
          }
        }
        return Rectangle().fill(Color.clear)
      }
}

struct CustomListWithAlphabet_Previews: PreviewProvider {
    
    @State var previewBinding = ""
    
    static var previews: some View {
        CustomListWithAlphabet(selection: .constant(""), carsArray: ["1 Series", "4 Series", "Alfa Romeo", "BMW", "Tesla", "Porsche", "Ferrari", "Seat", "Volkswagen", "Lamborghini"], showingSideScroller: true, withNumbers: true)
    }
}
