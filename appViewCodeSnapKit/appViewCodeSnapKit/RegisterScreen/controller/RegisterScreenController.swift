//
//  RegisterScreenViewController.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 15/10/21.
//

import UIKit
import Firebase

class RegisterScreenController: UIViewController {
    
    var auth: Auth?
    var alert: Alert?
    var registerScreen: RegisterScreen?
        
    override func loadView() {
        registerScreen = RegisterScreen()
        self.view = registerScreen
        registerScreen?.initialConfigRegisterButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.registerScreenDelegate(delegate: self)
        registerScreen?.textFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}
