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
    
    //회원가입
    static let signUp = "/user/signup"
    //로그인
    static let login = "/user/login"
  
    //개인 정보
    static let userInto = "/user/my/account"
    //개인 프로젝트
    static let userProject = "/project/my"
    //개인 프로젝트 색상 정보
    static let userColorInfo = "/project/my/color" 
    
    //프로젝트 생성
    static let createProject = "/project"
    //프로젝트 일정 리스트
    static let projectSchedule = "/schedule/project/"
    //프로젝트 회원 정보
    static let projectMemberInfo = "/project/member/"
    
    //초대 코드
    static let inviteCode = "/project/code/"
    //초대 코드로 입장
    static let attendProject = "/project/admission"

}
