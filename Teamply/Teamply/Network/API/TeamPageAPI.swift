//
//  TeamPageAPI.swift
//  Teamply
//
//  Created by 아라 on 2023/02/15.
//

import Moya

final class TeamPageAPI {
    static let shared: TeamPageAPI = TeamPageAPI()
    private let projectScheduleProvider = MoyaProvider<TeamPageService>(plugins: [MoyaLoggingPlugin()])
    private let projectMemberProvider = MoyaProvider<TeamPageService>(plugins: [MoyaLoggingPlugin()])
    private let inviteCodeProvider = MoyaProvider<TeamPageService>(plugins: [MoyaLoggingPlugin()])
    
    private init() { }
    
    public private(set) var projectScheduleData: GeneralResponse<ProjectScheduleResponse>?
    public private(set) var projectMemberData: GeneralResponse<ProjectMemberResponse>?
    public private(set) var inviteCode: GeneralResponse<InviteCodeResponse>?
    
    // MARK: - Get
    
    func getProjectScheduleList(param: Int, completion: @escaping ((GeneralResponse<ProjectScheduleResponse>?, Error?) -> ())) {
        
        projectScheduleProvider.request(.getProjectSchedule(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.projectScheduleData = try result.map(GeneralResponse<ProjectScheduleResponse>?.self)
                    guard let projectScheduleData = self?.projectScheduleData else { return }
                    completion(projectScheduleData, nil)
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
    
    func getProjectMemberInfo(param: Int, completion: @escaping ((GeneralResponse<ProjectMemberResponse>?, Error?) -> ())) {
        projectScheduleProvider.request(.getProjectMember(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.projectMemberData = try result.map(GeneralResponse<ProjectMemberResponse>?.self)
                    guard let projectMemberData = self?.projectMemberData else { return }
                    completion(projectMemberData, nil)
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
    
    func getInviteCode(param: Int, completion: @escaping ((GeneralResponse<InviteCodeResponse>?, Error?) -> ())) {
        inviteCodeProvider.request(.getInviteCode(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.inviteCode = try result.map(GeneralResponse<InviteCodeResponse>?.self)
                    guard let inviteCode = self?.inviteCode else { return }
                    completion(inviteCode, nil)
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
