//
//  ViewModifier.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

extension View {
    
    func CustomStroke(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeSize: width,
        strokeColor: color))
    }

    func roundedRectangleFillBackgroundSystemGray() -> some View {
        self.background(
            RoundedRectangle(cornerRadius: 8, style: .circular)
                .fill(Color.Basic.grey1)
        )
    }

}
