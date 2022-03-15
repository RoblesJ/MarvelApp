//
//  CharactersController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//


import UIKit
import Firebase

private let cellIdentifier = "CharacterCell"

class CharacterController: UICollectionViewController {
    // MARK: - Propperties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    // MARK: - Actions
    @objc
    private func handleLogOut() {
        do {
            try Auth.auth().signOut()
            let controller = LoginController()
            controller.delegate = self.tabBarController as? MainTabController
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch {
            print("DEBUG: failed to sign out")
        }
    }
    
    // MARK: - Helpers
    private func configureCollectionView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
        collectionView.backgroundColor = .lightGray
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CharacterCell
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CharacterController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailModel(character: CharacterDetailConstants.character, characterImage: CharacterDetailConstants.characterImage, characterText: CharacterDetailConstants.characterText, appearanceText: CharacterDetailConstants.appearanceText, comicText: CharacterDetailConstants.comicText)
        self.navigationController?.pushViewController(CharacterDetailViewController(detail: detail), animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 16
        let height = view.frame.height / 5.5
        return CGSize(width: width, height: height)
    }
}
