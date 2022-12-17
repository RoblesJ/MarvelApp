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
    private var apiDataManager: EventsAPIDataManagerProtocol = EventsApiDataManager()
    var eventVM = MarvelEventListViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchData()
    }
    
    // MARK: - Actions

    private func fetchData() {
        self.apiDataManager.fetch { [weak self] response in
            guard let strongSelf = self else { return }
            switch response {
            case .failure(let error):
                print("\(error.localizedDescription)")
            case.success(let result):
                let events = result.data.results.map( { MarvelEventViewModel(event: $0) } )
                strongSelf.eventVM.events = events
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func configureTableView() {
        view.backgroundColor = .white
        self.tableView.separatorStyle = .singleLine
        tableView.register(UINib(nibName: .cellName, bundle: nil), forCellReuseIdentifier: .reuseIdentifier)
    }
}

//MARK: - UITableViewDataSource
extension MarvelEventsController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventVM.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .reuseIdentifier, for: indexPath) as! EventCell
        cell.configure(withEvent: eventVM.eventAtIndex(indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = self.view.frame.height / 5
        return rowHeight
    }
}


