//
//  URLConstant.swift
//  Teamply
//
//  Created by 아라 on 2023/01/29.
//

import Foundation

struct URLConstant {
    
    // MARK: - base URL
    
    static let baseURL = "http://ec2-3-36-54-148.ap-northeast-2.compute.amazonaws.com"
    
    static let signUp = "/user/signup"                              //회원가입
    static let login = "/user/login"                                //로그인
    
    static let userInto = "/user/my/account"                        //개인 정보
    static let userProject = "/project/my"                          //개인 프로젝트
    
    static let createProject = "/project"                           //프로젝트 생성
    static let completedProject = "/project/my/finish/comments"     //완료된 팀 프로젝트

}
