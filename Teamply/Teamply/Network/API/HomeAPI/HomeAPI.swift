//
//  HomeAPI.swift
//  Teamply
//
//  Created by 아라 on 2023/02/12.
//

import Moya

final class HomeAPI {
    static let shared: HomeAPI = HomeAPI()
    private let userInfoProvider = MoyaProvider<HomeService>(plugins: [MoyaLoggingPlugin()])
    private let userProjectProvider = MoyaProvider<HomeService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var userInfoData: GeneralResponse<UserInfoResponse>?
    public private(set) var userProjectData: GeneralResponse<UserProjectResponse>?
    
    // MARK: - Get
    
    func getUserInfo(completion: @escaping ((GeneralResponse<UserInfoResponse>?) -> ())) {
        userInfoProvider.request(.getUserInfo) { result in
            switch result {
            case .success(let response):
                do {
                    self.userInfoData = try response.map(GeneralResponse<UserInfoResponse>?.self)
                    guard let userInfoData = self.userInfoData else {
                        return
                    }
                    completion(userInfoData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func getUserProjectInfo(completion: @escaping ((GeneralResponse<UserProjectResponse>?) -> ())) {
        userProjectProvider.request(.getUserProject) { result in
            switch result {
            case .success(let response):
                do {
                    self.userProjectData = try response.map(GeneralResponse<UserProjectResponse>?.self)
                    guard let userProjectData = self.userProjectData else {
                        return
                    }
                    completion(userProjectData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
