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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaGFzaCI6ImFhNjAwYmIxMzgxN2ZiMmExYjdmIiwiaXAiOjM1NTU1NTI4MzQsImlhdCI6MTY3NjM2OTUwOSwiZXhwIjoxNjc2NDU1OTA5fQ.rDAkkiSy9XjBPC0Lz9AdYNcth4E3NfnmQON8xE2ymMA'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzYzNjk1MDksImV4cCI6MTY3ODE4MzkwOX0.lxd46I8vhAERASeFC1_2W3YhdQJx-LJr6krawszU0-I'"
}
