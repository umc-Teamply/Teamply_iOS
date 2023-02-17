//
//  LogInAPI.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Moya

final class LogInAPI {
    static let shared: LogInAPI = LogInAPI()
    private let loginProvider = MoyaProvider<LogInService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var loginResult: GeneralResponse<LogInResponse>?
    
    // MARK: - Post
    
    func logIn(param: LogInRequest, completion: @escaping ((GeneralResponse<LogInResponse>?, Error?) -> ())) {
        loginProvider.request(.login(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.loginResult = try result.map(GeneralResponse<LogInResponse>?.self)
                    guard let loginResult = self?.loginResult else { return }
                    completion(loginResult, nil)
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

