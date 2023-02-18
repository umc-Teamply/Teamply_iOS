//
//  BoxService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/14.
//

import Moya

enum BoxService {
    //case getCompletedProject
    case getUserProject
}

extension BoxService: BaseTargetType {
    var path: String {
        switch self {
        //case .getCompletedProject:
        //   return URLConstant.completedProject
        case .getUserProject:
            return URLConstant.userProject
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUserProject:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.hasTokenHeader
    }
}
