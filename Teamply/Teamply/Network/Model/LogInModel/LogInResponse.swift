//
//  LogInResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Foundation

struct LogInResponse: Codable {
    let accessToken: String
    let refreshToken: String
}
