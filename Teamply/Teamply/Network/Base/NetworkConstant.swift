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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaGFzaCI6ImQ0NTJjNzQzNmE5Njg0ZjRmYmFhIiwiaXAiOjM1NTU1NTI4MzQsImlhdCI6MTY3NjY4NTU3OSwiZXhwIjoxNjc2NzcxOTc5fQ.RNForA-UmpstDvncrY2ps5G3JNF86_-hRByats72OO0'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzY2ODU1NzksImV4cCI6MTY3ODQ5OTk3OX0.ND8_Y0COQtm_frMIm45mdvyHpoBblFBtcbjMSydhDx0'"
}
