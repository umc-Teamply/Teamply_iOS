//
//  UserProjectResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/12.
//

import Foundation

struct UserProjectResponse: Codable {
    let result: [ProjectInfo]
}

struct ProjectInfo: Codable {
    let projectId: Int
    let title, contents: String
    let totalcount, realCount: Int
    let startDate, endDate, color: String
    
    enum CodingKeys: String, CodingKey {
        case projectId = "proj_id"
        case title = "proj_name"
        case totalcount = "proj_headcount"
        case realCount = "proj_realcount"
        case startDate = "startAt"
        case endDate = "endAt"
        case contents = "proj_contents"
        case color
    }
}
