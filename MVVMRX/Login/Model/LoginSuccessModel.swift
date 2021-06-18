//
//  LoginSuccessModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//

import Foundation
struct LoginSuccessModel : Codable {
    let status : Bool?
    let data : LoginData?
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(LoginData.self, forKey: .data)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }

}
struct LoginData : Codable {
    let id : Int?
    let name : String?
    let email : String?
    let phone : String?
    let email_verified_at : String?
    let birth : String?
    let api_token : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case email_verified_at = "email_verified_at"
        case birth = "birth"
        case api_token = "api_token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
        birth = try values.decodeIfPresent(String.self, forKey: .birth)
        api_token = try values.decodeIfPresent(String.self, forKey: .api_token)
    }

}

