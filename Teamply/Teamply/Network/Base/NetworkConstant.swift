//
//  NetworkConstant.swift
//  Teamply
//
//  Created by 아라 on 2023/01/29.
//

import Foundation

struct NetworkConstant {
    
    static let noTokenHeader = ["Content-Type": "application/json"]
    static let hasTokenHeader = ["Content-Type": "application/json",
                                 "Authorization": NetworkConstant.accessToken,
                                 "Refresh": NetworkConstant.refreshToken]
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaGFzaCI6ImFhNjAwYmIxMzgxN2ZiMmExYjdmIiwiaXAiOjM1NTU1NTI4MzQsImlhdCI6MTY3NjUzOTc3NSwiZXhwIjoxNjc2NjI2MTc1fQ.d2MTCL8pY7rekTIVCMHit-cw8bQbHsoM8x797T8Iu1k'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzY1Mzk3NzUsImV4cCI6MTY3ODM1NDE3NX0.BaercNQ0X4io7LFQVUrUNCoF1eaPyNt84JDCVZKjZdY'"
}
