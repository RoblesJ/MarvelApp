//
//  RegistrationController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Propperties
    private var registrationVM = RegistrationViewModel()
    weak var delegate: AuthenticationDelegate?
    
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
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account? ", secondPart: "Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Actions
    @objc
    private func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullname = fullnameTextField.text else { return }
        guard let username = usernameTextField.text?.lowercased() else { return }
        
        let credentials = AuthCredentials(email: email, password: password, fullname: fullname, username: username)
        
        AuthService.registerUser(withCredential: credentials) { error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            self.delegate?.authenticationDidComplete()
        }
    }
    
    @objc
    private func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            registrationVM.email = sender.text
        } else if sender == passwordTextField {
            registrationVM.password = sender.text
        } else if sender == fullnameTextField {
            registrationVM.fullname = sender.text
        } else {
            registrationVM.username = sender.text
        }
        updateForm()
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
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

extension RegistrationController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = registrationVM.buttonBackgroundColor
        signUpButton.setTitleColor(registrationVM.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = registrationVM.formIsValid
    }
}
