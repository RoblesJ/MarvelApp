//
//  LoginController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

protocol AuthenticationDelegate: AnyObject {
    func authenticationDidComplete()
}

class LoginController: UIViewController {
    
    // MARK: - Propperties
    private var loginVM = LoginViewModel()
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(AuthenticationConstants.login, for: .normal)
        button.setTitleColor(.white.withAlphaComponent(0.67), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: AuthenticationConstants.registerFirst,
                               secondPart: AuthenticationConstants.registerSecond)
        button.addTarget(self, action: #selector(handleShowSignup), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Actions
    @objc
    private func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        AuthService.logUserIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: failed to log user in \(error.localizedDescription)")
            }
            self.delegate?.authenticationDidComplete()
        }
    }
    
    @objc
    private func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            loginVM.email = sender.text
        } else {
            loginVM.password = sender.text
        }
        updateForm()
        
    }
    
    @objc
    private func handleShowSignup(){
        let controller = RegistrationController()
        controller.delegate = delegate
        navigationController?.pushViewController(controller, animated: true)
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
        stack.anchor(top: marvelLogo.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 24, paddingLeft: 32, paddingRight: 24)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 24, paddingRight: 24)
        
    }
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

extension LoginController: FormViewModel {
    func updateForm() {
        loginButton.backgroundColor = loginVM.buttonBackgroundColor
        loginButton.setTitleColor(loginVM.buttonTitleColor, for: .normal)
        loginButton.isEnabled = loginVM.formIsValid
    }
}
