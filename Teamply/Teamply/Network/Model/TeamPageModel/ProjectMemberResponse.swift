//
//  ProjectMemberResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Foundation

struct ProjectMemberResponse: Codable {
    let result: [Member]
}

// MARK: - Result
struct Member: Codable {
    let userID: Int
    let userName, userEmail: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userName = "user_name"
        case userEmail = "user_email"
    }
}
