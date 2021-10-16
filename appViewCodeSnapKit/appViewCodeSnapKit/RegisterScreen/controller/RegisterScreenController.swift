//
//  RegisterScreenViewController.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 15/10/21.
//

import UIKit

class RegisterScreenController: UIViewController {
    
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

    }
}
