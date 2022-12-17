//
//  MarvelCharacterViewModel.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 20/03/2022.
//

import Foundation

struct MarvelCharacterViewModel {
    
    let character: MarvelCharacter
    
    var characterName: String {
        return character.name
    }
    
    var characterImg: URL? {
        return URL(string: "\(character.thumbnail.path).jpg")
    }
    
    var characterDescription: String {
        return character.description
    }
    
    var comicAppearances: String {
        var appearances: String = ""
        character.comics.items.forEach { comic in
            appearances.append("\(comic.name) \n \n")
        }
        return appearances
    }
    var appearanceTitle: String {
        return "Appearance in Comics:"
    }
    
    init(character: MarvelCharacter) {
        self.character = character
    }
}
