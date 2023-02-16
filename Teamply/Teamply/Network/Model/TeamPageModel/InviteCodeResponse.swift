//
//  InviteCodeResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/16.
//

import Foundation

struct InviteCodeResponse: Codable {
    let result: [InviteCode]
}

struct InviteCode: Codable {
    let code: String
}
