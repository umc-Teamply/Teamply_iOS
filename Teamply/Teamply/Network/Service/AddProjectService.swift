//
//  AddProjectService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Moya

enum AddProjectService {
    case postCreateProject(param: CreateProjectRequest)
}

extension AddProjectService: BaseTargetType {
    var path: String {
        switch self {
        case .postCreateProject:
            return URLConstant.createProject
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postCreateProject(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.hasTokenHeader
    }
}
