//
//  Constants.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

struct AuthenticationConstants {
    static let email: String = "Email"
    static let password: String = "Password"
    static let registerFirst: String = "Don't have an account " // keep space, it looks better
    static let registerSecond: String = "Sign up"
    static let login: String = "Login"
    static let fullname: String = "Full Name"
    static let username: String = "Username"
    static let signUp: String = "Sign Up"
}

struct MainTabControllerConstants {
    static let characterIconFilled: UIImage = {
        guard let image = UIImage(systemName: "person.3.fill") else { return #imageLiteral(resourceName: "first") }
        return image
    }()
    
    static let characterIconUnfilled: UIImage = {
        guard let image = UIImage(systemName: "person.3") else { return #imageLiteral(resourceName: "first") }
        return image
    }()
    
    static let eventsIconFilled: UIImage = {
        guard let image = UIImage(systemName: "bookmark.fill") else { return #imageLiteral(resourceName: "first") }
        return image
    }()
    
    static let eventsIconUnfilled: UIImage = {
        guard let image = UIImage(systemName: "bookmark") else { return #imageLiteral(resourceName: "first") }
        return image
    }()
    
    static let profileIconFilled: UIImage = {
        guard let image = UIImage(systemName: "person.crop.circle.fill") else { return #imageLiteral(resourceName: "first") }
        return image
    }()
    
    static let profileIconUnfilled: UIImage = {
        guard let image = UIImage(systemName: "person.crop.circle") else { return #imageLiteral(resourceName: "first") }
        return image
    }()
}
