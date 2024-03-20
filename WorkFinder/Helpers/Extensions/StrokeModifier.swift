//
//  StrokeModifier.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct StrokeModifier: ViewModifier {

    private let id = UUID()
    var strokeSize: CGFloat
    var strokeColor: Color
    
    /// Modifies the view by adding stroke with specified size and color.
    ///
    /// - Parameters:
    ///   - content: The content view to be modified.
    /// - Returns: The modified view with stroke.
    func body(content: Content) -> some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask({
                        outline(context: content)
                    })
            )
    }
    
    /// Creates an outline view to apply stroke to the content.
    ///
    /// - Parameters:
    ///   - context: The content view to be outlined.
    /// - Returns: The outlined view with stroke.
    func outline(context: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            context.tag(id)
                .shadow(radius: strokeSize)
        }
    }
}
