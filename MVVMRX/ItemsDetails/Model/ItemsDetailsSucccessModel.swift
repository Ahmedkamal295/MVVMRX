//
//  ItemsDetailsSucccessModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/16/21.
//

import Foundation
struct ItemsDetailsSucccessModel : Codable {
    let status : Bool?
    let data : [ItemsDetailsSucccessData]?
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([ItemsDetailsSucccessData].self, forKey: .data)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }

}
struct ItemsDetailsSucccessData : Codable {
    let id : Int?
    let price : String?
    let discount_price : String?
    let percentage_discount : String?
    let code : String?
    let name : String?
    let body : String?
    let chosen : Int?
    let isFav : Bool?
    let in_stock : Bool?
    let currency_code : String?
    let currency_value : Int?
    let category : ProductDetailsCategory?
    let subcategory : ProductDetailsSubcategory?
    let material : ProductDetailsMaterial?
    let details : [ProductDDetails]?
    let main_image :  ProductDetailsMain_image?
    let size_image : ProductDetailsSize_image?
    let sub_images : [ProductDetailsSub_images]?
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case price = "price"
        case discount_price = "discount_price"
        case percentage_discount = "percentage_discount"
        case code = "code"
        case name = "name"
        case body = "body"
        case chosen = "chosen"
        case isFav = "isFav"
        case in_stock = "in_stock"
        case currency_code = "currency_code"
        case currency_value = "currency_value"
        case category = "category"
        case subcategory = "subcategory"
        case material = "material"
        case details = "details"
        case main_image = "main_image"
        case size_image = "size_image"
        case sub_images = "sub_images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        discount_price = try values.decodeIfPresent(String.self, forKey: .discount_price)
        percentage_discount = try values.decodeIfPresent(String.self, forKey: .percentage_discount)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        body = try values.decodeIfPresent(String.self, forKey: .body)
        chosen = try values.decodeIfPresent(Int.self, forKey: .chosen)
        isFav = try values.decodeIfPresent(Bool.self, forKey: .isFav)
        in_stock = try values.decodeIfPresent(Bool.self, forKey: .in_stock)
        currency_code = try values.decodeIfPresent(String.self, forKey: .currency_code)
        currency_value = try values.decodeIfPresent(Int.self, forKey: .currency_value)
        category = try values.decodeIfPresent(ProductDetailsCategory.self, forKey: .category)
        subcategory = try values.decodeIfPresent(ProductDetailsSubcategory.self, forKey: .subcategory)
        material = try values.decodeIfPresent(ProductDetailsMaterial.self, forKey: .material)
        details = try values.decodeIfPresent([ProductDDetails].self, forKey: .details)
        main_image = try values.decodeIfPresent(ProductDetailsMain_image.self, forKey: .main_image)
        size_image = try values.decodeIfPresent(ProductDetailsSize_image.self, forKey: .size_image)
        sub_images = try values.decodeIfPresent([ProductDetailsSub_images].self, forKey: .sub_images)
    }

}


struct ProductDDetails : Codable {
    let sizes : [ProductDetailsSize]?
    let color : ProductDetailsColor?

    enum CodingKeys: String, CodingKey {

        case sizes = "sizes"
        case color = "color"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sizes = try values.decodeIfPresent([ProductDetailsSize].self, forKey: .sizes)
        color = try values.decodeIfPresent(ProductDetailsColor.self, forKey: .color)
    }

}
struct ProductDetailsColor : Codable {
    let id : Int?
    let color : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case color = "color"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct ProductDetailsCategory : Codable {
    let id : Int?
    let name : String?
    let subcategories_count : Int?
    let sub_categories : [ProductDetailsSubcategory]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case subcategories_count = "subcategories_count"
        case sub_categories = "sub_categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        subcategories_count = try values.decodeIfPresent(Int.self, forKey: .subcategories_count)
        sub_categories = try values.decodeIfPresent([ProductDetailsSubcategory].self, forKey: .sub_categories)
    }

}
struct ProductDetailsSubcategory : Codable {
    let id : Int?
    let name : String?
    let subcategories_count : Int?
    let sub_categories : [String]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case subcategories_count = "subcategories_count"
        case sub_categories = "sub_categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        subcategories_count = try values.decodeIfPresent(Int.self, forKey: .subcategories_count)
        sub_categories = try values.decodeIfPresent([String].self, forKey: .sub_categories)
    }

}
struct Sub_categories : Codable {
    let id : Int?
    let name_ar : String?
    let name_en : String?
    let parent_id : Int?
    let slug : String?
    let home_page : Int?
    let active : Int?
    let subcategories_count : Int?
    let sub_categories : [String]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name_ar = "name_ar"
        case name_en = "name_en"
        case parent_id = "parent_id"
        case slug = "slug"
        case home_page = "home_page"
        case active = "active"
        case subcategories_count = "subcategories_count"
        case sub_categories = "sub_categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name_ar = try values.decodeIfPresent(String.self, forKey: .name_ar)
        name_en = try values.decodeIfPresent(String.self, forKey: .name_en)
        parent_id = try values.decodeIfPresent(Int.self, forKey: .parent_id)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        home_page = try values.decodeIfPresent(Int.self, forKey: .home_page)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        subcategories_count = try values.decodeIfPresent(Int.self, forKey: .subcategories_count)
        sub_categories = try values.decodeIfPresent([String].self, forKey: .sub_categories)
    }

}

struct ProductDetailsSize : Codable {
    let id : Int?
    let code : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        code = try values.decodeIfPresent(String.self, forKey: .code)
    }

}
struct ProductDetailsMaterial : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct ProductDetailsMain_image : Codable {
    let image_url : String?

    enum CodingKeys: String, CodingKey {

        case image_url = "image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
    }

}

struct ProductDetailsSub_images : Codable {
    let image_url : String?

    enum CodingKeys: String, CodingKey {

        case image_url = "image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
    }

}
struct ProductDetailsSize_image : Codable {
    let image_url : String?

    enum CodingKeys: String, CodingKey {

        case image_url = "image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
    }

}
