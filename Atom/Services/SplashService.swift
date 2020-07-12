//
//  ApiClient.swift
//  Atom
//
//  Created by Marta on 10/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON

class SplashService{
    
    let BASE_URL: String = "https://api.themoviedb.org/3/"; //TODO: Mover a una clase de constantes
    let API_KEY = "2241d51419c29096ac0b6a22ba6014b6"
    let headers = ["Content-Type": "application/json"]
    
    func getConfiguration(onSuccess: @escaping((String) -> Void), onFailure: @escaping ((Error?) -> Void)){
        let url = BASE_URL + "configuration"
        Alamofire.request(url, method: .get, parameters: ["api_key": API_KEY]).validate().responseJSON { (dataResponse) in
        
        
            if dataResponse.result.isSuccess{
                if let result = dataResponse.result.value {
                    let JSON = result as! [String:AnyObject]
                    let images = JSON["images"] as! [String:AnyObject]
                    let url = images["base_url"] as! String
                    onSuccess(url)
                }
            }else{
                onFailure(dataResponse.result.error)
            }
        }
            
    }
}
    
    
       
    


