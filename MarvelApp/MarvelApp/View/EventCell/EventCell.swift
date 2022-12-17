//
//  EventCell2TableViewCell.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 14/03/2022.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventContainerView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventStackView: UIStackView!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureLayers()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(withEvent event: MarvelEventViewModel) {
        self.descriptionLabel.text = event.startDate
        self.eventImageView.sd_setImage(with: event.eventImg)
        self.eventImageView.contentMode = .scaleAspectFill
        self.eventImageView.clipsToBounds = true
        self.eventLabel.text = event.title
    }

    private func configureLayers() {
        eventContainerView.layer.borderColor = UIColor.clear.cgColor
        eventContainerView.layer.borderWidth = 1
        eventContainerView.layer.cornerRadius = 15
        eventContainerView.layer.masksToBounds = true
    }
}
