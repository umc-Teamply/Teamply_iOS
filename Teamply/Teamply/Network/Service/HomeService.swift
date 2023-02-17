//
//  HomeService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/11.
//

import Moya

enum HomeService {
    case getUserInfo
    case getUserProject
}

extension HomeService: BaseTargetType {
    var path: String {
        switch self {
        case .getUserInfo:
            return URLConstant.userInto
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
        case .getUserInfo, .getUserProject:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.hasTokenHeader
    }
}
