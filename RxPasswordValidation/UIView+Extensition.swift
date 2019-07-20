//
//  UIView+Subviews.swift
//  Splash
//
//  Created by 안관수 on 2018. 9. 21..
//  Copyright © 2018년 안관수. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach({ self.addSubview($0) })
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
