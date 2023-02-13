//
//  CreateProjectRequest.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Foundation

struct CreateProject: Codable {
    let title: String
    let headcount: Int
    let startAt, endAt, contents, color: String
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case headcount, startAt, endAt, contents, color
    }
}
