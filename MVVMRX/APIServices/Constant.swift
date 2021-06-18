//
//  Constant.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//

import Foundation

enum WebService: String {
    
    //MARK:- URL Request
    case login = "login"
    case home = "home/hot_offers"
    
    //MARK:- Demo URL Link
    var urlLink: String  {
        return "https://najlaboutique.qa/api/\(self.rawValue)"
    }
    
}
