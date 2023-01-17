//
//  UIFont+.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit

extension UIFont {
    public enum fontType: String{
        case bold = "Bold"
        case medium = "Medium"
    }
    
    static func NotoSansKR(_ type: fontType, size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansKR-\(type).rawValue", size: size)!
    }
}

extension UIFont {
    class var head1: UIFont {
        return UIFont(name: "NotoSansKR-Bold", size: 20.0)!
    }
    
    class var head2: UIFont {
        return UIFont(name: "NotoSansKR-Medium", size: 20.0)!
    }
    
    class var sub1: UIFont {
        return UIFont(name: "NotoSansKR-Bold", size: 16.0)!
    }
    
    class var sub2: UIFont {
        return UIFont(name: "NotoSansKR-Medium", size: 16.0) ?? UIFont()
    }
    
    class var body: UIFont {
        return UIFont(name: "NotoSansKR-Medium", size: 14.0)!
    }
    
    class var cap1: UIFont {
        return UIFont(name: "NotoSansKR-Medium", size: 16.0)!
    }
    
    class var cap2: UIFont {
        return UIFont(name: "NotoSansKR-Medium", size: 13.0)!
    }
    
    class var cap3: UIFont {
        return UIFont(name: "NotoSansKR-Medium", size: 11.0)!
    }
    
    class var btn: UIFont {
        return UIFont(name: "NotoSansKR-Bold", size: 16.0)!
    }
}
