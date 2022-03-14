//
//  EventCell.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 14/03/2022.
//

import UIKit

class EventCell: UITableViewCell {
    //MARK: - Properties
    
    private let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "1360297")
        return iv
    }()
    
    private let eventLabel: UILabel = {
        let label = UILabel()
        label.text = "some posible event"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "29 de Febrero de 2023"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(eventImageView)
        let eventImageWidth = (contentView.bounds.width / 2.5) - 4
        eventImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 4)
        eventImageView.setDimensions(height: eventImageWidth, width: eventImageWidth)
        
        let stack = UIStackView(arrangedSubviews: [eventLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        
        contentView.addSubview(stack)
        stack.anchor(top: contentView.topAnchor, left: eventImageView.rightAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 16, paddingRight: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
