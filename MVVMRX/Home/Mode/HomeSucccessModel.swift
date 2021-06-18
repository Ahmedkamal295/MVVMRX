//
//  HomeSucccessModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/16/21.
//

import Foundation
struct HomeSucccessModel : Codable {
    let status : Bool?
    let data : [HomeSucccessData]?
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([HomeSucccessData].self, forKey: .data)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }

}
struct HomeSucccessData : Codable {
    let id : Int?
    let name : String?
    let price : String?
    let discount_price : String?
    let percentage_discount : String?
    let isFav : Bool?
    let in_stock : Bool?
    let currency_code : String?
    let currency_value : Int?
    let main_image : Main_image?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case price = "price"
        case discount_price = "discount_price"
        case percentage_discount = "percentage_discount"
        case isFav = "isFav"
        case in_stock = "in_stock"
        case currency_code = "currency_code"
        case currency_value = "currency_value"
        case main_image = "main_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        discount_price = try values.decodeIfPresent(String.self, forKey: .discount_price)
        percentage_discount = try values.decodeIfPresent(String.self, forKey: .percentage_discount)
        isFav = try values.decodeIfPresent(Bool.self, forKey: .isFav)
        in_stock = try values.decodeIfPresent(Bool.self, forKey: .in_stock)
        currency_code = try values.decodeIfPresent(String.self, forKey: .currency_code)
        currency_value = try values.decodeIfPresent(Int.self, forKey: .currency_value)
        main_image = try values.decodeIfPresent(Main_image.self, forKey: .main_image)
    }

}
struct Main_image : Codable {
    let image_url : String?

    enum CodingKeys: String, CodingKey {

        case image_url = "image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
    }

}
