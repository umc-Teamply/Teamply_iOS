//
//  TeamPageService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Moya

enum TeamPageService {
    case getProjectSchedule(param: Int)
}

extension TeamPageService: BaseTargetType {
    var path: String {
        switch self {
        case .getProjectSchedule(let projectId):
            return URLConstant.projectSchedule+"\(projectId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getProjectSchedule:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.hasTokenHeader
    }
}
