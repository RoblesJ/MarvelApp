//
//  MarvelCharacterListViewModel.swift
//  MarvelApp
//
//  Created by Julio Ismael Robles on 20/03/2022.
//

import Foundation

struct MarvelCharacterListViewModel {
    var characters: [MarvelCharacterViewModel] = []
    
    var numberOfSections: Int {
        return characters.count/15
    }
    
    var numberOfRowsInSection: Int {
        return 15
    }
    
    func characterAtIndex(_ index: Int) -> MarvelCharacterViewModel {
        return characters[index]
    }
}
