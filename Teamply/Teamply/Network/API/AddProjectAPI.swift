//
//  AddProjectAPI.swift
//  Teamply
//
//  Created by 아라 on 2023/02/13.
//

import Moya

final class AddProjectAPI {
    static let shared: AddProjectAPI = AddProjectAPI()
    private let colorInfoProvider = MoyaProvider<HomeService>(plugins: [MoyaLoggingPlugin()])
    private let createProjectProvider = MoyaProvider<AddProjectService>(plugins: [MoyaLoggingPlugin()])
    private let attendProjectProvider = MoyaProvider<AddProjectService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var colorData: GeneralResponse<UserProjectResponse>?
    public private(set) var createResult: GeneralResponse<CreateProjectResponse>?
    public private(set) var attendResult: GeneralResponse<AttendProjectResponse>?
    
    // MARK: - Get
//    func getcolorInfo(completion: @escaping ((GeneralResponse<ColorInfoResponse>?) -> ())) {
//        colorInfoProvider.request(.getColorInfo) { result in
//            switch result {
//            case .success(let response):
//                do {
//                    self.colorData = try response.map(GeneralResponse<ColorInfoResponse>?.self)
//                    guard let colorData = self.colorData else {
//                        return
//                    }
//                    completion(colorData)
//                } catch(let err) {
//                    print(err.localizedDescription, 500)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//                completion(nil)
//            }
//        }
//    }
    
    func getcolorInfo(completion: @escaping ((GeneralResponse<UserProjectResponse>?) -> ())) {
        colorInfoProvider.request(.getUserProject) { result in
            switch result {
            case .success(let response):
                do {
                    self.colorData = try response.map(GeneralResponse<UserProjectResponse>?.self)
                    guard let colorData = self.colorData else {
                        return
                    }
                    completion(colorData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
    // MARK: - Post
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
    
    func attendProject(param: AttendProjectRequest, completion: @escaping ((GeneralResponse<AttendProjectResponse>?, Error?) -> ())) {
        attendProjectProvider.request(.postAttendProject(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.attendResult = try result.map(GeneralResponse<AttendProjectResponse>?.self)
                    guard let attendResult = self?.attendResult else { return }
                    completion(attendResult, nil)
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
