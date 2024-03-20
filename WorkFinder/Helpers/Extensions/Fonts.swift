//
//  Font.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 15.03.2024.
//

import SwiftUI

extension Font {
    /// Creates and returns a semibold font with the specified size.
    ///
    /// - Parameter size: The size of the font.
    /// - Returns: A semibold font.
    static func semibold(size: CGFloat) -> Font {
        Font.custom("SFProDisplay-Semibold", size: size)
    }
    /// Creates and returns a medium font with the specified size.
    ///
    /// - Parameter size: The size of the font.
    /// - Returns: A medium font.
    static func medium(size: CGFloat) -> Font {
        Font.custom("SFProDisplay-Medium", size: size)
    }
    /// Creates and returns a regular font with the specified size.
    ///
    /// - Parameter size: The size of the font.
    /// - Returns: A regular font.
    static func regular(size: CGFloat) -> Font {
        Font.custom("SFProDisplay-Regular", size: size)
    }
}
