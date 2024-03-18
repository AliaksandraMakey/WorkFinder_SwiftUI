//
//  Font.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 15.03.2024.
//

import SwiftUI

extension Font {

    static func sembold(size: CGFloat) -> Font {
        Font.custom("SFProDisplay-Semibold", size: size)
    }

    static func medium(size: CGFloat) -> Font {
        Font.custom("SFProDisplay-Medium", size: size)
    }

    static func regular(size: CGFloat) -> Font {
        Font.custom("SFProDisplay-Regular", size: size)
    }
}
