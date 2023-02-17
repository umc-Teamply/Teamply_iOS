//
//  SignUpAPi.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import Moya

final class SignUpAPI {
    static let shared: SignUpAPI = SignUpAPI()
    private let signupProvider = MoyaProvider<SignUpService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var signupResult: GeneralResponse<SignUpResponse>?
    
    // MARK: - Post
    
    func signUp(param: SignUpRequest, completion: @escaping ((GeneralResponse<SignUpResponse>?, Error?) -> ())) {
        signupProvider.request(.signUp(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.signupResult = try result.map(GeneralResponse<SignUpResponse>?.self)
                    guard let signupResult = self?.signupResult else { return }
                    completion(signupResult, nil)
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
