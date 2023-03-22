//
//  ViewExtension.swift
//  AutoTraderClone
//
//  Created by James Armer on 28/01/2023.
//

import SwiftUI

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
