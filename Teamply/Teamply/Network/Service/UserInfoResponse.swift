//
//  UserInfoResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/12.
//

import Foundation

struct UserInfoResponse: Codable {
    let userName: String
}

struct UserProjectResponse: Codable {
    let projectId, headCount: Int
    let title, content: String
    let startAt, endAt: String

    enum CodingKeys: String, CodingKey {
        case projectId = "proj_id"
        case title = "proj_name"
        case headCount = "proj_headcount"
        case startAt = "proj_startAt"
        case endAt = "proj_endAt"
        case content = "proj_contents"
    }
}
