//
//  MainViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.makeShadow(UIColor.gray3!, 0.3, CGSize(width: 0, height: -3), 10)
        
    }
    
}
