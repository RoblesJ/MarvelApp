//
//  ViewController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 14/03/2022.
//

import UIKit

// turn this into a real model
struct DetailModel {
    let character: String
    let characterImage: UIImage
    let characterText: String
    let appearanceText: String
    let comicText: String
}

class CharacterDetailViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var comicDescription: UILabel!
    
    private var characterVM: MarvelCharacterViewModel
    
    init(detail: MarvelCharacterViewModel) {
        self.characterVM = detail
        super.init(nibName: "CharacterDetailViewController", bundle: Bundle.main)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateData()
        
    }
    //MARK: - Helpers
    private func configureUI() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.characterLabel.textAlignment = .center
        self.characterLabel.numberOfLines = 0
        self.characterLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.appearanceLabel.font = UIFont.boldSystemFont(ofSize: 24)
        self.appearanceLabel.textAlignment = .center
        self.comicDescription.numberOfLines = 0
        self.comicDescription.font = UIFont.systemFont(ofSize: 18)
    }
    private func populateData() {
        print(characterVM.characterImg?.absoluteString)
        self.navigationItem.title = characterVM.characterName
        self.imageView.sd_setImage(with: characterVM.characterImg)
        self.characterLabel.text = characterVM.characterDescription
        self.appearanceLabel.text = characterVM.appearanceTitle
        self.comicDescription.text = characterVM.comicAppearances
    }
}
