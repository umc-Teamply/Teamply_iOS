//
//  ProjectInfoDataModel.swift
//  Teamply
//
//  Created by 아라 on 2023/02/12.
//

import Foundation

struct ProjectInfoDataModel: Codable, Hashable{
    let projId: Int
    let title: String
    let headcount: Int
    let startAt, endAt, contents: String
    
    enum CodingKeys: String, CodingKey {
        case projId = "proj_id"
        case title = "proj_name"
        case headcount = "proj_headcount"
        case startAt = "proj_startAt"
        case endAt = "proj_endAt"
        case contents = "proj_contents"
        //case color
    }
}
