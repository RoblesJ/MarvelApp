//
//  AuthService.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 14/03/2022.
//

import UIKit
import Firebase


struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
            }
            guard let uid = result?.user.uid else { return }
            let data: [String: Any] = ["email" : credentials.email,
                                       "fullname" : credentials.fullname,
                                       "uid" : uid,
                                       "username" : credentials.username]
            COLLECTION_USERS.document(uid).setData(data, completion: completion)
        }
    }
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}
