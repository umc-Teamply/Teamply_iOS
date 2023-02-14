//
//  CompletedProjectResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/14.
//

import Foundation

struct CompletedProjectResponse: Codable {
    let result: [CompletedInfo]
}

struct CompletedInfo: Codable {
    let projectId: Int
    let title, contents: String
    let headcount: Int
    let startDate, endDate, color: String
    
    enum CodingKeys: String, CodingKey {
        case projectId = "proj_id"
        case title = "proj_name"
        case headcount = "proj_realcount"
        case startDate = "startAt"
        case endDate = "endAt"
        case contents = "proj_contents"
        case color
    }
}
