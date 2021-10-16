//
//  File.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 15/10/21.
//

import Foundation
import UIKit

extension LoginScreenController: LoginScreenProtocol {
    
    func actionLoginButton() {
        print("Novo usuário cadastrado!")
    }
    
    func actionRegisterButton() {
        
        let registerScreenViewController = RegisterScreenController()
        navigationController?.pushViewController(registerScreenViewController, animated: true)
    }
}

extension LoginScreenController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.enableLoginButton()
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
