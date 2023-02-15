//
//  AttendProjectRequest.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Foundation

struct AttendProjectRequest: Codable {
    let inviteCode, color: String

    enum CodingKeys: String, CodingKey {
        case inviteCode = "invite_code"
        case color
    }
}
