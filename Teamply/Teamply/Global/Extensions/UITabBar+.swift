//
//  UITabBar+.swift
//  Teamply
//
//  Created by 아라 on 2023/01/22.
//

import Foundation
import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
