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
    private var apiDataManager: MarvelAPIDataManagerProtocol = MarvelApiDataManager()
    var listVM = MarvelCharacterListViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchData()
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
    private func fetchData() {
        self.apiDataManager.fetch { [weak self] response in
            guard let strongSelf = self else { return }
            switch response {
            case .failure(let error):
                print("\(error.localizedDescription)")
            case.success(let result):
                let characters = result.data.results.map( { MarvelCharacterViewModel(character: $0) } )
                strongSelf.listVM.characters = characters
                print("\(characters.count)")
                DispatchQueue.main.async {
                    strongSelf.collectionView.reloadData()
                }
            }
        }
    }
    
    private func configureCollectionView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(handleLogOut))
        collectionView.backgroundColor = .lightGray
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listVM.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listVM.numberOfRowsInSection
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CharacterCell
        let character = listVM.characterAtIndex(indexPath.row)
        cell.configure(withCharacter: character)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CharacterController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = listVM.characters[indexPath.row]
        self.navigationController?.pushViewController(CharacterDetailViewController(detail: detail), animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharacterController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = view.frame.width - 16
        let height = view.frame.height / 5.5
        return CGSize(width: width, height: height)
    }
}
