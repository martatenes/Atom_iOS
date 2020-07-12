//
//  MoviesView.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation


protocol MoviesView: NSObjectProtocol{
    
    func startLoading()
    func stopLoading()
    func setMovies(movies: [Movie]?)
    func showError()
}
