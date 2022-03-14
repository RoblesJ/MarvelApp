//
//  ProfileHeader.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 14/03/2022.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "name here"
        label.textColor = .white
        return label
    }()
    
    private let favoritedImages: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "favorite count: 0"
        label.textColor = .white
        return label
    }()
    
    private lazy var editProfilleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleEditProfile), for: .touchUpInside)
        return button
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .red
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.init(cgColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)).cgColor]
        gradient.locations = [0, 0.9]
        layer.addSublayer(gradient)
        gradient.frame = frame
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, favoritedImages])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 18
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 32, paddingLeft: 24, paddingRight: 24)
        addSubview(editProfilleButton)
        editProfilleButton.anchor(top: stack.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 24, paddingLeft: 48, paddingRight: 48)
        addSubview(logoutButton)
        logoutButton.anchor(top: editProfilleButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 24, paddingLeft: 48, paddingRight: 48)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc
    private func handleEditProfile() {
        print("DEBUG: Handle edit profile")
    }
    @objc
    private func handleLogout() {
        print("DEBUG: Handle logout")
    }
}
