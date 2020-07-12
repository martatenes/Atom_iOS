//
//  MoviesPresenter.swift
//  Atom
//
//  Created by Marta on 12/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation


class MoviesPresenter{
    
    
    fileprivate let moviesService: MoviesService
    weak fileprivate var moviesView: MoviesView?
    
    init(moviesService: MoviesService){
        self.moviesService = moviesService
    }
    
    func attachView(_ view: MoviesView){
        moviesView = view;
    }
    
    func detachView(){
        moviesView = nil;
    }
    
    func getMovies(){
        self.moviesView?.startLoading()
        
        moviesService.getPopularMovies(onSuccess: { (response: [Movie]?) in
            debugPrint(response)
            self.moviesView?.stopLoading()
            self.moviesView?.setMovies(movies: response)
        }) { (error: Error?) in
            debugPrint(error)
            self.moviesView?.stopLoading()
            self.moviesView?.showError()
        }
    }
}
