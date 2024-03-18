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
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(Rectangle()
            .foregroundColor(strokeColor)
            .mask({
                outline (context: content)
            })
        )
    }
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
