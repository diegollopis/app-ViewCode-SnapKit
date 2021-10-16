//
//  Alert.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 16/10/21.
//

import Foundation
import UIKit

class Alert {
    
    var controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel){ action in
            completion?()
        }
        alertController.addAction(okButton)
        self.controller?.present(alertController, animated: true, completion: nil)
    }
}
