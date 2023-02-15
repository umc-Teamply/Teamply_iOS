//
//  AttendProjectResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Foundation

struct AttendProjectResponse: Codable {
    let isSuccess: Bool
    let statuscode: Int
    let message: String
}
