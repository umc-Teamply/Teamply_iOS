//
//  ProjectScheduleResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Foundation

struct ProjectScheduleResponse: Codable {
    let result: [Schedule]
}

struct Schedule: Codable {
    let schID, projID: Int
    let schTitle, schContents, schProgress, startAt, endAt: String

    enum CodingKeys: String, CodingKey {
        case schID = "sch_id"
        case projID = "proj_id"
        case schTitle = "sch_title"
        case schContents = "sch_contents"
        case schProgress = "sch_progress"
        case startAt, endAt
    }
}
