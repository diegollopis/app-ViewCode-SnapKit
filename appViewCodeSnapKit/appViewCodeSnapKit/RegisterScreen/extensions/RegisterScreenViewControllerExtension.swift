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
        self.navigationController?.popViewController(animated: true)
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
