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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcsImhhc2giOiI4MjgyZDhmMWIwODA3YjdkNDliOCIsImlwIjozNTU1NTUyODM0LCJpYXQiOjE2NzYzMDU2MTYsImV4cCI6MTY3NjM5MjAxNn0.ZYvEJIL23gzx0lvPvM1wr52r9rDMkAi4J-5ywJG5QRU'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzYzMDU2MTYsImV4cCI6MTY3ODEyMDAxNn0.W7UyFIBNsra8HSitfYUTpynIxzRnxywY_PVgeV45lnc'"
}
