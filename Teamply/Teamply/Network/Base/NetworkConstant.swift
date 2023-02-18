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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaGFzaCI6ImJjMjdhNjUxMTU0OTFkNTNhMWFjIiwiaXAiOjM1NTU1NTI4MzQsImlhdCI6MTY3NjcxMzA5MCwiZXhwIjoxNjc2Nzk5NDkwfQ.EVqRwva1390hnYqbXpWEeI9xzrogPiGnwImdsPEendM'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzY3MTMwOTAsImV4cCI6MTY3ODUyNzQ5MH0.PczGVbI8JuprMBh_0zLfnXM-_bt9cNM_9oUEg46YBO4'"
}
