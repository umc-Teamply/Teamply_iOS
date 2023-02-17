//
//  SignUpRequest.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Foundation

struct SignUpRequest: Codable {
    let name: String
    let email: String
    let pw: String
    let accessConsent: Int
    let serviceConsent: Int
}
