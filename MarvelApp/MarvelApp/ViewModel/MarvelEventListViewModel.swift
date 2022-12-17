//
//  MarvelEventListViewModel.swift
//  MarvelApp
//
//  Created by JRobles on 16/12/2022.
//

import Foundation

struct MarvelEventListViewModel {
    var events: [MarvelEventViewModel] = []

    var numberOfSections: Int {
        1
    }

    var numberOfRowsInSection: Int {
        events.count
    }

    func eventAtIndex(_ index: Int) -> MarvelEventViewModel {
        return events[index]
    }
}
