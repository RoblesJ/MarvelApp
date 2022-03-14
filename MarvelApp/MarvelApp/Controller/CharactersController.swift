//
//  CharactersController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//


import UIKit

private let cellIdentifier = "CharacterCell"

class CharacterController: UICollectionViewController {
    // MARK: - Propperties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    private func configureCollectionView() {
        collectionView.backgroundColor = .gray
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
