//
//  CreateProjectResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Foundation

struct CreateProjectResponse: Codable {
    let projectId: Int
    
    enum CodingKeys: String, CodingKey {
        case projectId = "proj_id"
    }
}
