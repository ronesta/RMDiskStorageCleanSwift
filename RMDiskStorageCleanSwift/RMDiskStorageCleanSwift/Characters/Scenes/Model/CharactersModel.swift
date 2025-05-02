//
//  CharacterModel.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

enum CharactersModel {
    struct Request {
    }

    struct Response: Equatable {
        let characters: [Character]
    }

    struct ViewModel: Equatable {
        let characters: [Character]
    }
}
