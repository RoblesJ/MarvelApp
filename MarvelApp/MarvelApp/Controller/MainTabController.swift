//
//  MainTabController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Propperties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    private func configureViewControllers() {
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
    private func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.barTintColor = .black
        return nav
    }
}
