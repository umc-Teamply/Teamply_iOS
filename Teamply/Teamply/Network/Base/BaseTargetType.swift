//
//  BaseTargetType.swift
//  Teamply
//
//  Created by 아라 on 2023/01/29.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
