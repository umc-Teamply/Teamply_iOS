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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaGFzaCI6ImQ0NTJjNzQzNmE5Njg0ZjRmYmFhIiwiaXAiOjM1NTU1NTI4MzQsImlhdCI6MTY3NjQ1NjAxMiwiZXhwIjoxNjc2NTQyNDEyfQ.w0d5TVeTtv925b8cBXFqh2iqqPeJi7n4PKb4g_Ojty4'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzY0NTYwMTIsImV4cCI6MTY3ODI3MDQxMn0.XrNuEII79h-bxGUyVgEyrlIO-smuR08HDwUqZ9G3exs'"
}
