//
//  BoxAPI.swift
//  Teamply
//
//  Created by 아라 on 2023/02/14.
//

import Moya

final class BoxAPI {
    static let shared: BoxAPI = BoxAPI()
    private let userProjectProvider = MoyaProvider<HomeService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var userProjectData: GeneralResponse<UserProjectResponse>?
    
    // MARK: - Get
    func getInProgressProjectList(completion: @escaping ((GeneralResponse<UserProjectResponse>?) -> ())) {
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
