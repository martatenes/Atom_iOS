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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        if UserDefaults.standard.string(forKey: "BASE_URL") != nil{
            onShowMovies()
        }
        else{
           splashPresenter.getConfiguration()

        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        splashPresenter.detachView()
    }
    
    func onShowMovies(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let moviesVC = storyBoard.instantiateViewController(withIdentifier: "MoviesVC") as! MoviesVC
        self.present(moviesVC, animated: true, completion: nil)
    }

}

extension SplashVC: SplashView{
    
    func startLoading(){
        spinner.startAnimating()
    }
    
    func stopLoading(){
        spinner.stopAnimating()
    }
    
    func setConfiguration(_ url: String) {
        debugPrint("respuesta", url)
        UserDefaults.standard.set(url, forKey: "BASE_URL")
    }
    
    func showError(){
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
