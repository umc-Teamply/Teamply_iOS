//
//  UserInfoResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/02/11.
//

import Foundation

struct UserInfoResponse: Codable {
    let result: [Info]
}

// MARK: - Result
struct Info: Codable {
    let userID: Int
    let userName, userEmail, userPw: String
    let accessConsent, serviceConsent, createIP, updateIP: Int
    let activate, isResigned: Int
    let createAt, updateAt: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userName = "user_name"
        case userEmail = "user_email"
        case userPw = "user_pw"
        case accessConsent, serviceConsent, createIP, updateIP, activate
        case isResigned = "is_resigned"
        case createAt, updateAt
    }

}
