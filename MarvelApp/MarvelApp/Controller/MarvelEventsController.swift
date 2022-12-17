//
//  MarvelEventsController.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 13/03/2022.
//


import UIKit
private extension String {
    static let reuseIdentifier = "EventCell"
    static let cellName = "EventCell"
}

class MarvelEventsController: UITableViewController {
    // MARK: - Propperties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    private func configureTableView() {
        view.backgroundColor = .white
        self.tableView.separatorStyle = .singleLine
        tableView.register(UINib(nibName: .cellName, bundle: nil), forCellReuseIdentifier: .reuseIdentifier)
//        tableView.register(EventCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
}

//MARK: - UITableViewDataSource
extension MarvelEventsController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .reuseIdentifier, for: indexPath) as! EventCell
        cell.eventImageView.image = #imageLiteral(resourceName: "1360297")
        cell.eventImageView.contentMode = .scaleAspectFill
        cell.eventImageView.clipsToBounds = true
        cell.eventLabel.text = "Some event"
        cell.descriptionLabel.text = "This will happen in the future"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = self.view.frame.height / 5
        return rowHeight
    }
}


