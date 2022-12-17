//
//  MarvelEventViewModel.swift
//  MarvelApp
//
//  Created by JRobles on 16/12/2022.
//

import Foundation

struct MarvelEventViewModel {
    let event: Event

    var title: String {
        event.title
    }

    var startDate: String {
        event.start ?? ""
    }

    var eventImg: URL? {
        return URL(string: "\(event.thumbnail.path).jpg")
    }
}
