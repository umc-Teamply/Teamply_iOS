//
//  AddProjectAPI.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Moya

final class AddProjectAPI {
    static let shared: AddProjectAPI = AddProjectAPI()
    private let createProjectProvider = MoyaProvider<AddProjectService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var createResult: GeneralResponse<CreateProjectResponse>?
    
    // MARK: - Get
    
    func createProject(param: CreateProjectRequest, completion: @escaping ((GeneralResponse<CreateProjectResponse>?, Error?) -> ())) {
        createProjectProvider.request(.postCreateProject(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.createResult = try result.map(GeneralResponse<CreateProjectResponse>?.self)
                    guard let createResult = self?.createResult else { return }
                    completion(createResult, nil)
                } catch(let err) {
                    print(err.localizedDescription)
                    completion(nil, err)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil, err)
            }
        }
    }
}
