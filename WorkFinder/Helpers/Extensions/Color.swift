//
//  Color.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 15.03.2024.
//

import SwiftUI

extension Color {
   enum Special {
       static let darkBlue = Color(#colorLiteral(red: 0, green: 0.2588235294, blue: 0.4901960784, alpha: 1))
       static let blue = Color(#colorLiteral(red: 0.168627451, green: 0.4941176471, blue: 0.9960784314, alpha: 1))
       static let darkGreen = Color(#colorLiteral(red: 0.003921568627, green: 0.3490196078, blue: 0.01960784314, alpha: 1))
       static let green = Color(#colorLiteral(red: 0.2980392157, green: 0.6980392157, blue: 0.3058823529, alpha: 1))
       static let red = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
   }
   
   enum Basic {
       static let black = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
       static let gray1 = Color(#colorLiteral(red: 0.1333333333, green: 0.137254902, blue: 0.1450980392, alpha: 1))
       static let gray2 = Color(#colorLiteral(red: 0.1921568627, green: 0.1960784314, blue: 0.2039215686, alpha: 1))
       static let gray3 = Color(#colorLiteral(red: 0.5215686275, green: 0.5254901961, blue: 0.5333333333, alpha: 1))
       static let gray4 = Color(#colorLiteral(red: 0.6235294118, green: 0.6235294118, blue: 0.6235294118, alpha: 1))
       static let gray5 = Color(#colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1))
       static let white = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
   }
   
   enum Shadow {
       static let shadows = Color(#colorLiteral(red: 0.04705882353, green: 0.04705882353, blue: 0.04705882353, alpha: 0.9))
   }
}
