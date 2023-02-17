//
//  SignUpService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Moya

enum SignUpService {
    case signUp(param: SignUpRequest)
}

extension SignUpService: BaseTargetType {
    var path: String {
        switch self {
        case .signUp:
            return URLConstant.signUp
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signUp(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.noTokenHeader
    }
}
