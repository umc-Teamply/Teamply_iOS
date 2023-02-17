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
    
    static var accessToken = "'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaGFzaCI6ImFhNjAwYmIxMzgxN2ZiMmExYjdmIiwiaXAiOjM1NTU1NTI4MzQsImlhdCI6MTY3NjYyNzQ0MSwiZXhwIjoxNjc2NzEzODQxfQ.-djrYhn7Ya677nmnXgfCldMMocICGU9xRcdTzKI2uGY'"
    static var refreshToken = "'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzY2Mjc0NDEsImV4cCI6MTY3ODQ0MTg0MX0.UGkaINgaCVaslzB_Taj-BGFLdSFk_NbKmXtYIjViZvA'"
}
