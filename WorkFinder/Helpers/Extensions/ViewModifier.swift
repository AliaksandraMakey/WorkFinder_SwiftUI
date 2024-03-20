//
//  ViewModifier.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

extension View {
    
    /// Adds a custom stroke to the view with the specified color and width.
    ///
    /// - Parameters:
    ///   - color: The color of the stroke.
    ///   - width: The width of the stroke.
    /// - Returns: The modified view with the custom stroke.
    func customStroke(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }

    /// Sets the background of the view to a rounded rectangle filled with System Gray color.
    ///
    /// - Returns: The modified view with the rounded rectangle background.
    func roundedRectangleFillBackgroundSystemGray() -> some View {
        self.background(
            RoundedRectangle(cornerRadius: 8, style: .circular)
                .fill(Color.Basic.gray1)
        )
    }

}
