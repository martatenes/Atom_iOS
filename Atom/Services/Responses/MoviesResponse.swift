//
//  MoviesResponse.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable{
    
    var page: Int!
    var total_results: CLong!
    var total_pages: CLong!
    var results: [Movie]?
}
