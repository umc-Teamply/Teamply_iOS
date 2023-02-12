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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsImhhc2giOiJlY2QyOTMxZWI4NmFhYzY0ZTU0MyIsImlwIjozNjMwMTcwODk2LCJpYXQiOjE2NzYxOTM4OTYsImV4cCI6MTY3NjI4MDI5Nn0.iKMDF-CmqiBhy1W4EE_0WxPIZqOgs9GcrV9NNojOmLI'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzYxOTM4OTYsImV4cCI6MTY3ODAwODI5Nn0.IzabCpr5Z66SyrlinzlzdUj6E6_lP1hqZYUD_d_uUzA'"
}
