//
//  AddProjectService.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Moya

enum AddProjectService {
    case postCreateProject(param: CreateProjectRequest)
    case postAttendProject(param: AttendProjectRequest)
    case getColorInfo
}

extension AddProjectService: BaseTargetType {
    var path: String {
        switch self {
        case .postCreateProject:
            return URLConstant.createProject
        case .postAttendProject:
            return URLConstant.attendProject
        case .getColorInfo:
            return URLConstant.userColorInfo
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getColorInfo:
            return .get
        case .postCreateProject(_), .postAttendProject(_):
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postCreateProject(let param):
            return .requestJSONEncodable(param)
        case .postAttendProject(let param):
            return .requestJSONEncodable(param)
        case .getColorInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.hasTokenHeader
    }
}
