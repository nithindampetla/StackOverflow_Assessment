//
//  Utils.swift
//  StackOverflowAssessment
//
//  Created by Nithin Chakravarthy Dampetla on 2/11/21.
//

import Foundation
import SwiftUI

class Utils {
    static let dateFormatterPrint: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter
    }()
}

extension Color {
    public static let customBlack = Color(#colorLiteral(red: 0.05882352941, green: 0.09019607843, blue: 0.1333333333, alpha: 1))
    public static let customWhite = Color(#colorLiteral(red: 0.7840602176, green: 0.9202123092, blue: 0.9827222842, alpha: 1))
    public static let customGreen = Color(#colorLiteral(red: 0.07058823529, green: 0.5019607843, blue: 0.1254901961, alpha: 1))
}

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextMedium(size: Int) -> Font {
        return Font.custom("AvenirNext-Medium", size: CGFloat(size))
    }
    
    static func avenirNextBold(size: Int) -> Font {
        return Font.custom("AvenirNext-Bold", size: CGFloat(size))
    }
    
    static func avenirMedium(size: Int) -> Font {
        return Font.custom("Avenir-Medium", size: CGFloat(size))
    }
}
