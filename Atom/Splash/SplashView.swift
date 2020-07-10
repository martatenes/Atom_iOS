//
//  SplashView.swift
//  Atom
//
//  Created by Marta on 10/7/20.
//  Copyright © 2020 Marta. All rights reserved.
//

import Foundation


protocol SplashView: NSObjectProtocol{
    func startLoading()
    func stopLoading()
    func setConfiguration(_ configuration: NSDictionary)
}
