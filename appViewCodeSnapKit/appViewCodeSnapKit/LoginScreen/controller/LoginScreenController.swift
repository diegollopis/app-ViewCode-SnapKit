//
//  ViewController.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 15/10/21.
//

import UIKit
import Firebase

class LoginScreenController: UIViewController {
    
    var auth: Auth?
    var alert: Alert?
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        self.view = loginScreen
        self.loginScreen?.initialConfigLoginButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.loginScreen?.loginScreenDelegate(delegate: self)
        self.loginScreen?.textFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}


    


