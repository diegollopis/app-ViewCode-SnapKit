//
//  RegisterScreenViewControllerExtension.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 16/10/21.
//

import Foundation
import UIKit

extension RegisterScreenController: RegisterScreenProtocol {
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else {return}
        
        let email: String = register.getEmail()
        let password: String = register.getPassword()
       
        self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                self.alert?.getAlert(title: "Erro", message: "Erro ao cadastrar, tente novamente mais tarde")
                
            } else {
                self.alert?.getAlert(title: "Sucesso", message: "Cadastro efetuado com sucesso", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
}

extension RegisterScreenController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.enableRegisterButton()
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
