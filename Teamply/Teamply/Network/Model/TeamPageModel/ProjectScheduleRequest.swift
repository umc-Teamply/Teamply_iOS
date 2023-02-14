//
//  ProjectScheduleRequest.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Foundation

struct ProjectScheduleRequest: Codable {
    let projectId: Int
    
    enum CodingKeys: String, CodingKey {
        case projectId = "projId"
    }
}
