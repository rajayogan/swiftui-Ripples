//
//  constants.swift
//  ripples
//
//  Created by Rajayogan on 07/05/25.
//

import Foundation
import SwiftUI

//Font helper
extension Font {
    static func cerapro(fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular, fontSize: CGFloat = 16) -> Font {
        return Font.custom(ceraprofont(weight: fontWeight).rawValue, size: fontSize)
    }
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 30
        case .title2: return 22
        case .title3: return 20
        case .headline: return 18
        case .body: return 16
        case .callout: return 15
        case .subheadline: return 14
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 8
        }
    }
}

enum ceraprofont: String {
    case regular = "cerapro-regular"
    case bold = "cerapro-bold"
    case light = "cerapro-light"
    case extraBold = "cerapro-black"
    case medium = "cerapro-medium"
    
    // Please ensure that you have all the above mentioned fonts in your directory.
    
    init(weight: Font.Weight) {
        switch weight {
        case .regular:
            self = .regular
        case .bold:
            self = .bold
        case .light:
            self = .light
        case .black:
            self = .extraBold
        case .medium:
            self = .medium
        default:
            self = .regular
        }
    }
}
