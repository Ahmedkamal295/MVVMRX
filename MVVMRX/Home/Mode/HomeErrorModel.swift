//
//  HomeErrorModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/16/21.
//

import Foundation
struct HomeErrorModel : Codable {
    let status : Bool?
    let msg : String?
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }

}
