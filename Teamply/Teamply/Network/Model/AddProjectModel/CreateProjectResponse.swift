//
//  CreateProjectResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Foundation

struct CreateProjectResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let data: Result
}

// MARK: - DataClass
struct Result: Codable {
    let result: [Project]
}

// MARK: - Result
struct Project: Codable {
    let projectId: Int

    enum CodingKeys: String, CodingKey {
        case projectId = "proj_id"
    }
}
