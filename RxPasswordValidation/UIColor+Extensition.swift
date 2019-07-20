//
//  UIColor+Extensition.swift
//  Splash
//
//  Created by 안관수 on 2018. 9. 27..
//  Copyright © 2018년 안관수. All rights reserved.
//

import Foundation
import UIKit

// from: https://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: 1.0
        )
    }
    
    convenience init(rgb: Int, alpha: CGFloat) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
}

extension UIColor {
    
    static var gradientBackground1: UIColor {
        return UIColor.init(rgb: 0x546fe8)
    }
    
    static var gradientBackground2: UIColor {
        return UIColor.init(rgb: 0x3147a7)
    }
    
    static var buttonTextColor: UIColor {
        return UIColor(rgb: 0x425bc7)
    }
    
    static var validationTextColor: UIColor {
        return UIColor(rgb: 0xffd103)
    }
    
    static var indicatorBlueColor: UIColor {
        return UIColor.init(rgb: 0x425bc7)
    }

    static var indicatorGrayColor: UIColor {
        return UIColor.gray
    }
    
    
}
