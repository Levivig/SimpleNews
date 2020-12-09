//
//  UIViewExtensions.swift
//  SimpleNews
//
//  Created by Levente Vig on 2020. 12. 05..
//  Copyright © 2020. levivig. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Create a gradient layer for a specific color style.
    ///
    /// - Parameter colorStyle: A specific color style which used to the view.
    /// - Returns: A gradient layer with colors.
    func createGradient(colors: [CGColor],
                        startPoint: CGPoint = CGPoint(x: 0, y: 0),
                        endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0),
                        cornerRadius: CGFloat = 8) -> CAGradientLayer {
        
        let oldLayer = self.layer.sublayers?.first(where: { layer -> Bool in
            layer.name == "Gradient"
        })
        oldLayer?.removeFromSuperlayer()
        self.layoutIfNeeded()
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        gradient.cornerRadius = cornerRadius
        
        gradient.colors = colors
        
        gradient.name = "Gradient"
        return gradient
        
    }
}
