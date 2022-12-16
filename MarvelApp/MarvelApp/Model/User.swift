//
//  User.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 14/03/2022.
//

import Foundation
import Firebase

struct User {
    let email: String
    let fullname: String
    let username: String
    let uid: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == uid }
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
