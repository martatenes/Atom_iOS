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
        
        splashService.getConfiguration(onSuccess: { (response: NSDictionary) in
            debugPrint(response)
            self.splashView?.stopLoading()
            self.splashView?.setConfiguration(response)
        }) { (error: String?) in
            debugPrint(error)
            self.splashView?.stopLoading()
        }
    }
}
