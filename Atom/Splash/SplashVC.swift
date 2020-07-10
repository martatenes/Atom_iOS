//
//  SplashVC.swift
//  Atom
//
//  Created by Marta on 8/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import UIKit


class SplashVC: UIViewController{
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    fileprivate let splashPresenter = SplashPresenter(splashService: SplashService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splashPresenter.attachView(self)
        splashPresenter.getConfiguration()
    }

}

extension SplashVC: SplashView{
    
    func startLoading(){
        spinner.startAnimating()
    }
    
    func stopLoading(){
        spinner.stopAnimating()
    }
    
    func setConfiguration(_ configuration: NSDictionary) {
        debugPrint("respuesta", configuration)
    }
}
