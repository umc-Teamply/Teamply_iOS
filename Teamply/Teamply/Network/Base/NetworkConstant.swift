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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzMsImhhc2giOiI4NTI1YTg2ZjIxYWMzYmFkOTY1NCIsImlwIjoyOTQ4NjQ4OTY2LCJpYXQiOjE2NzYyODg2NzksImV4cCI6MTY3NjM3NTA3OX0.xMZCDFGUO22EKtC8XL4PXz4_O8ZlV1HmhA0qWutdje4'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzYyODg2NzksImV4cCI6MTY3ODEwMzA3OX0.JPuLhsnVfy0gsUDPuy8FjpfpCunAKiYaOai5mSKU-is'"
}
