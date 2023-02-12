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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzMsImhhc2giOiI4NTI1YTg2ZjIxYWMzYmFkOTY1NCIsImlwIjoyOTQ4NjQ4OTY2LCJpYXQiOjE2NzYxODM0NDQsImV4cCI6MTY3NjI2OTg0NH0.N6IbJLqTwpLcnc8bIt4ls8EAl-oKeDuUKWg4Yejjb1g'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzYxODEyMDksImV4cCI6MTY3Nzk5NTYwOX0.VF_K4dSqR3gSd8OJNPxbKFosm9l7i6SAtcke-_gNrd0'"
}
