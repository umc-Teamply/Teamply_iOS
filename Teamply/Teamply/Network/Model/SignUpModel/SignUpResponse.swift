//
//  SignUpResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Foundation

struct SignUpResponse: Codable {
    let isSuccess: Bool?
    let code: Int
    let message: String
}
