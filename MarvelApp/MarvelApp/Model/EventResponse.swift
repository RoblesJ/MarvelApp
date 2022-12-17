//
//  EventResponse.swift
//  MarvelApp
//
//  Created by JRobles on 16/12/2022.
//

import Foundation

// MARK: - EventResponse
struct EventResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [Event]
}

// MARK: - Result
struct Event: Codable {
    let id: Int
    let title: String
    let start: String?
    let thumbnail: Thumbnail
    let comics: Characters

    enum CodingKeys: String, CodingKey {
        case id, title, start, thumbnail, comics
    }
}

// MARK: - Characters
struct Characters: Codable {
    let items: [Next]
}

// MARK: - Next
struct Next: Codable {
    let name: String
}


// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
}
