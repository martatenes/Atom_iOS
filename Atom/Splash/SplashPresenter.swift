//
//  SplashPresenter.swift
//  Atom
//
//  Created by Marta on 10/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation


class SplashPresenter{
    
    fileprivate let splashService: SplashService
    weak fileprivate var splashView: SplashView?
    
    init(splashService: SplashService){
        self.splashService = splashService
    }
    
    func attachView(_ view: SplashView){
        splashView = view;
    }
    
    func detachView(){
        splashView = nil;
    }
    
    func getConfiguration(){
        self.splashView?.startLoading()
        //TODO: Llamar a getConfiguration en A
        
        splashService.getConfiguration(onSuccess: { (response: String) in
            debugPrint(response)
            self.splashView?.stopLoading()
            self.splashView?.setConfiguration(response)
        }) { (error: Error?) in
            debugPrint(error)
            self.splashView?.stopLoading()
            self.splashView?.showError()
        }
    }
}
