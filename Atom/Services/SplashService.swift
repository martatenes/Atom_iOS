//
//  ApiClient.swift
//  Atom
//
//  Created by Marta on 10/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation
import Alamofire

class SplashService{
    
    let BASE_URL: String = "http://api.themoviedb.org/3/";
    let API_KEY = "2241d51419c29096ac0b6a22ba6014b6"
    let headers = ["Content-Type": "application/json"]
    
    func getConfiguration(onSuccess: @escaping((NSDictionary) -> Void), onFailure: @escaping ((String?) -> Void)){
        let url = BASE_URL + "configuration"
        let params = ["api_key": API_KEY]
        Alamofire.request(url, method: HTTPMethod.get, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
            switch response.result{
            case .success(let JSON):
                let response = JSON as! NSDictionary
                debugPrint(response)
                onSuccess(response)
                
            case .failure(let error):
                let afError = error as! AFError
                debugPrint(afError)
                onFailure(afError.errorDescription)
            }
        }
    
    }
}
