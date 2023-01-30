//
//  GeneralResponse.swift
//  Teamply
//
//  Created by 아라 on 2023/01/29.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case message
        case success
        case data
        case status
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
/// status, message, success 이외에 정보를 사용하지 않는 경우에 VoidType를 설정해주면 됩니다!
struct VoidType: Codable{}
