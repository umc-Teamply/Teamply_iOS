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
    
    private init() { }
    
    public private(set) var projectScheduleData: GeneralResponse<ProjectScheduleResponse>?
    
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
}
