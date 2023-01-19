//
//  UIView+.swift
//  Teamply
//
//  Created by 아라 on 2023/01/18.
//

import UIKit

extension UIView {
    func makeRound(radius: CGFloat){
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func makeShadow(_ color: UIColor, _ opacity: Float, _ offset: CGSize, _ radius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
}
