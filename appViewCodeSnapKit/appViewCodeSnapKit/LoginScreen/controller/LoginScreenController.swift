//
//  ViewController.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 15/10/21.
//

import UIKit

class LoginScreenController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        self.view = loginScreen
        loginScreen?.configInitialLoadLoginButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.loginScreen?.loginScreenDelegate(delegate: self)
        self.loginScreen?.textFieldDelegate(delegate: self)
    }
}


    


