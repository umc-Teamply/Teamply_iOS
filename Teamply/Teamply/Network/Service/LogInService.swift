//
//  LogInService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Moya

enum LogInService {
    case login(param: LogInRequest)
}

extension LogInService: BaseTargetType {
    var path: String {
        switch self {
        case .login:
            return URLConstant.login
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.noTokenHeader
    }
}
