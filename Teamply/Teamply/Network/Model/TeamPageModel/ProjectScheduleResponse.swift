//
//  ProjectScheduleResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Foundation

struct ProjectScheduleResponseEelement: Codable {
    let scheduleId, projectId: Int
    let title, contents, startDate, endDate: String

    enum CodingKeys: String, CodingKey {
        case scheduleId = "sch_id"
        case projectId = "proj_id"
        case title = "sch_title"
        case contents = "sch_contents"
        case startDate = "startAt"
        case endDate = "endAt"
    }
}

typealias ProjectScheduleResponse = [ProjectScheduleResponseEelement]
