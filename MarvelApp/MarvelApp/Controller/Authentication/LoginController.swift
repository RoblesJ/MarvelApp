//
//  LoginController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

class LoginController: UIViewController {
    
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(AuthenticationConstants.login, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = true // implement
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: AuthenticationConstants.registerFirst,
                               secondPart: AuthenticationConstants.registerSecond)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureUI()
    }
    
    // MARK: - Actions
    @objc
    private func handleLogin() {
        print("DEBUG: Implement sign up button.")
    }
    
    // MARK: - Helpers
    func configureUI() {
        
        configureGradientLayer()
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(marvelLogo)
        marvelLogo.centerX(inView: view)
        marvelLogo.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 72)
        marvelLogo.setDimensions(height: 124, width: 248)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: marvelLogo.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingRight: 24)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 24, paddingRight: 24)
        
    }
}
