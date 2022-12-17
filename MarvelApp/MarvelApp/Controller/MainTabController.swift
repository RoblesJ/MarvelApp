//
//  MainTabController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Propperties
    private var user: User? {
        didSet {
            guard let user = user else { return }
            configureViewControllers(withUser: user)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        fetchUser()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    private func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
            print("DEBUG: finished fetching user")
        }
    }
    
    private func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    private func configureViewControllers(withUser user: User) {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let characters = templateNavigationController(unselectedImage: MainTabControllerConstants.characterIconUnfilled,
                                                      selectedImage: MainTabControllerConstants.characterIconFilled,
                                                      rootViewController: CharacterController(collectionViewLayout: layout))
        let events = templateNavigationController(unselectedImage: MainTabControllerConstants.eventsIconUnfilled,
                                                  selectedImage: MainTabControllerConstants.eventsIconFilled,
                                                  rootViewController: MarvelEventsController())
        let profile = templateNavigationController(unselectedImage: MainTabControllerConstants.profileIconUnfilled,
                                                   selectedImage: MainTabControllerConstants.profileIconFilled,
                                                   rootViewController: ProfileController())
        viewControllers = [characters, events, profile]
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
    
    /// NavigationControllers builder to be managed by MainTabController
    /// - Parameters:
    ///   - unselectedImage: UIImage to show when tab is unselected
    ///   - selectedImage: UIImage to show when tab is selected
    ///   - rootViewController: Destination VC
    /// - Returns: UINavigationController
    private func templateNavigationController(
        unselectedImage: UIImage,
        selectedImage: UIImage,
        rootViewController: UIViewController
    ) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .white
        nav.navigationBar.barTintColor = .black
        return nav
    }
}

//MARK: - AuthenticationDelegate
extension MainTabController: AuthenticationDelegate {
    func authenticationDidComplete() {
        fetchUser()
        self.dismiss(animated: true, completion: nil)
    }
}
