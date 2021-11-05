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
        
        let homeScreenViewController = HomeScreenViewController()
        navigationController?.pushViewController(homeScreenViewController, animated: true)
        
//        guard let login = self.loginScreen else {return}
//
//        let email = login.getEmail()
//        let password = login.getPassword()
//
//        auth?.signIn(withEmail: email, password: password, completion: { user, error in
//            if error != nil {
//                self.alert?.getAlert(title: "Erro", message: "Não foi possível completar sua solicitação, tente novamente mais tarde")
//            } else {
//                if user == nil {
//                    self.alert?.getAlert(title: "Erro", message: "Usuário não encontrado. Tente novamente")
//                } else {
//                    self.alert?.getAlert(title: "Sucesso", message: "Login efetuado com sucesso!!")
//                }
//            }
//        })
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
