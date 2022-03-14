//
//  CharacterCell.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    // MARK - Properties
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "1360297")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.text = "hero name".capitalized
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "someone who is very incredible and likes to put very long texts to make sure it will not be unreadable"
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
    
    func configureBorders() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
