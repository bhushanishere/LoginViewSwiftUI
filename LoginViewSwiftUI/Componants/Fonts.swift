//
//  Fonts.swift
//  LoginViewSwiftUI
//
//  Created by Bhushan Borse DXC on 10/04/24.
//

import Foundation
import SwiftUI

func GilroyFont(isBold: Bool = false, size: CGFloat) -> Font {
    if isBold {
        return Font.custom("Gilroy-ExtraBold", size: size)
    } else {
        return Font.custom("Gilroy-Light", size: size)
    }
}
