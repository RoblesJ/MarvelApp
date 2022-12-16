//
//  MarvelResponse.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 20/03/2022.
//

import Foundation

struct MarvelResponse: Decodable {
    let data: DataResponse
}

struct DataResponse: Decodable {
    let results: [MarvelCharacter]
}

struct MarvelCharacter: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: CharacterThumbnail
    let comics: Comics
    let events: Events
}

struct CharacterThumbnail: Decodable {
    let path: String
}

struct Comics: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicItems]
}

struct ComicItems: Decodable {
    let resourceURI: String
    let name: String
}

struct Events: Decodable {
    let available: Int
    let collectionURI: String
    let items: [EventItems]
}

struct EventItems: Decodable {
    let resourceURI: String
    let name: String
}
