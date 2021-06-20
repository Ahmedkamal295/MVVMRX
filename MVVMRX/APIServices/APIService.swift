//
//  APIServices.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//
import Foundation
import UIKit
import MOLH
import Alamofire

class ApiServices {

    var lang : String = "ar"
    private init() {}
    static let instance = ApiServices()
  
    func FetchData<T: Codable, E: Codable>(url: String, methodType: HTTPMethod?, parameters: [String: AnyObject]? = nil, completion: @escaping (T?, E?, Error?) -> Void) {

     
    
        //MARK:-  Language
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            self.lang = "ar"
        }else{
            self.lang = "en"
        }
        
       //MARK:-  headers with login
        var headers: HTTPHeaders? = nil
        if Helper.getapitoken() != "" && Helper.getapitoken() != nil {
            
            headers = [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(Helper.getapitoken()!)",
                "lang": self.lang,
            ]
            
        }else{
            //MARK:-  headers with Not login
            headers = [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "lang": self.lang,
            ]
        }
        guard let url = URL(string: url) else { return }
        AF.request(url, method: methodType ?? .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseJSON { (response) in

                print(response)

                switch response.result {

                case .success(let value):
                    print(value)
                  
                    guard let statusCode = response.response?.statusCode else { return }
                    if statusCode == 200 || (statusCode >= 200 && statusCode <= 299) {
                        print("Status code : \(statusCode)")
                        print(self.lang)
                        do {

                            // successful request
                            guard let theJsonResponse =  try? response.result.get() else {
                                // ADD Custom Error
                                return
                            }
                            guard let theJsonData = try? JSONSerialization.data(withJSONObject: theJsonResponse, options: []) else {
                                // add Custom Error
                                return
                            }
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            guard let theJsonObj = try decoder.decode(T?.self, from: theJsonData) else {
                                // add Custom Error
                                return
                            }
                            completion(theJsonObj, nil, nil)

                        }catch let jsonError {

                            print(jsonError)
                        }
                    }

                //MARK:- handel failure request error
                case .failure(let error):
                    let statusCode = response.response?.statusCode ?? 0
                    if statusCode == 401 || (statusCode >= 400 && statusCode <= 499) {
                        print("Status code : \(statusCode)")
                        do {
                            // successful request
                            guard let theJsonResponse =  try? response.result.get() else {

                                // add Custom Error

                                return
                            }
                            guard let theJsonData = try? JSONSerialization.data(withJSONObject: theJsonResponse, options: []) else {

                                // add Custom Error

                                return
                            }

                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            guard let dataErrorJsonObj = try decoder.decode(E?.self, from: theJsonData) else {
                                // add Custom Error
                                return
                            }

                            completion(nil, dataErrorJsonObj, nil)

                        }catch let jsonError {

                            print(jsonError)

                        }
                    }else {
                        //MARK:- handel internet connection error
                        completion(nil, nil, error)
                        print(error.localizedDescription)
                       // self.showStatus(image:#imageLiteral(resourceName: "NoInterNet"), message: "No internet")
                    }
            }
        }
    }
}

