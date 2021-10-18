//
//  RegisterScreen.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 15/10/21.
//

import UIKit

class RegisterScreen: UIView, ViewCodeProtocol {
    
    var delegate: RegisterScreenProtocol?
    
    func registerScreenDelegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var addUserImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.badge.plus")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu email"
        textField.backgroundColor = .white
        textField.textColor = .lightGray
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textColor = .darkGray
        passwordTextField.backgroundColor = .white
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.keyboardType = .default
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textContentType = .oneTimeCode
        return passwordTextField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setBackgroundColor()
        self.configView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    func initialConfigRegisterButton() {
        self.registerButton.setTitleColor(.lightGray, for: .normal)
        self.registerButton.isEnabled = false
    }
    
    func getEmail() -> String {
        self.emailTextField.text ?? ""
    }
    
    func getPassword() -> String {
        self.passwordTextField.text ?? ""
    }
    
    func areTextFieldsEmpty() -> Bool {
        let email = self.getEmail()
        let password = self.getPassword()
        
        if email != "" && password != ""{
            return true
        } else {
           return false
        }
    }
    
    func enableRegisterButton() {
        if areTextFieldsEmpty() {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    @objc func backButtonPressed() {
        self.delegate?.actionBackButton()
    }
    
    @objc func registerButtonPressed() {
        self.delegate?.actionRegisterButton()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    func configView() {
        self.addSubview(self.addUserImage)
        self.addSubview(self.backButton)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.addUserImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.addUserImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.addUserImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.addUserImage.heightAnchor.constraint(equalToConstant: 200),
            
            
            self.backButton.topAnchor.constraint(equalTo: self.addUserImage.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            
            self.emailTextField.topAnchor.constraint(equalTo: self.addUserImage.bottomAnchor, constant: 15),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
}
