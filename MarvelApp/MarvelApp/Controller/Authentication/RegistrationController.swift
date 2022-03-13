//
//  RegistrationController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Propperties
    
    private let marvelLogo: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "marvel_logo_icon_181411"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: AuthenticationConstants.email)
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: AuthenticationConstants.password)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let fullnameTextField: UITextField = {
        let tf = CustomTextField(placeholder: AuthenticationConstants.fullname)
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = CustomTextField(placeholder: AuthenticationConstants.username)
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(AuthenticationConstants.signUp, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = true // implement
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    @objc
    private func handleSignUp() {
        print("DEBUG: implement signup")
    }
    
    // MARK: - Helpers
    private func configureUI() {
        configureGradientLayer()
        
        view.addSubview(marvelLogo)
        marvelLogo.centerX(inView: view)
        marvelLogo.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 72)
        marvelLogo.setDimensions(height: 124, width: 248)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.center(inView: view)
        stack.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 24, paddingRight: 24)
    }
}
