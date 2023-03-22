//
//  CustomButtonTap.swift
//  AutoTraderClone
//
//  Created by James Armer on 24/01/2023.
//

import Foundation
import SwiftUI

struct NonHighlightingButton: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onTapGesture { configuration.trigger() }
    }
}
