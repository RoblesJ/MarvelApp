//
//  CharacterCell.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit
import SDWebImage

class CharacterCell: UICollectionViewCell {
    
    // MARK - Properties
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        return label
    }()
    
    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureBorders()
        
        contentView.addSubview(postImageView)
        let postImageWidth = contentView.frame.height - 4
        postImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 2, paddingLeft: 2, paddingBottom: 2)
        postImageView.setDimensions(height: postImageWidth, width: postImageWidth)
        
        let stack = UIStackView(arrangedSubviews: [characterLabel, descriptionLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        
        contentView.addSubview(stack)
        stack.anchor(top: contentView.topAnchor, left: postImageView.rightAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 2, paddingBottom: 16, paddingRight: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withCharacter character: MarvelCharacterViewModel) {
        self.postImageView.sd_setImage(with: character.characterImg)
        self.characterLabel.text = character.characterName
        self.descriptionLabel.text = character.characterDescription
    }
    
    private func configureBorders() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
    }
}
