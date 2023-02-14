//
//  ColorInfoResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/14.
//

import Foundation

struct ColorInfoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let data: Result
}

struct Result: Codable {
    let result: [Color]
}

struct Color: Codable {
    let color: String
}
