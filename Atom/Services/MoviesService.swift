//
//  MoviesService.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON

class MoviesService{
    
    let BASE_URL: String = "https://api.themoviedb.org/3/";
    let API_KEY = "2241d51419c29096ac0b6a22ba6014b6"
    let headers = ["Content-Type": "application/json"]
    
    func getPopularMovies(onSuccess: @escaping(([Movie]?) -> Void), onFailure: @escaping ((Error?) -> Void)){
        let url = BASE_URL + "movie/popular"
        Alamofire.request(url, method: .get, parameters: ["api_key": API_KEY]).validate().responseJSON { (dataResponse) in
            
            
            if dataResponse.result.isSuccess{
                if let result = dataResponse.result.value {
                    do{
                        let jsonData = try JSONSerialization.data(withJSONObject: result, options: JSONSerialization.WritingOptions.prettyPrinted)
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MoviesResponse.self, from: jsonData)
                        onSuccess(response.results)
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }else{
                onFailure(dataResponse.result.error)
            }
        }
        
    }
}
