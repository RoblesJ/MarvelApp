//
//  Constants.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")

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

struct CharacterDetailConstants {
    static let character: String = "Thanos"
    static let characterImage: UIImage = #imageLiteral(resourceName: "1360297")
    static let characterText: String = "ThanosLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proiden"
    static let appearanceText: String = "Appearences in Comics"
    static let comicText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
}
