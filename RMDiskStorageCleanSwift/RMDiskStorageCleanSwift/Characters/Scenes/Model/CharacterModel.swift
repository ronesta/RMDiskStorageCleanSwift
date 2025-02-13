//
//  CharacterModel.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

enum CharacterModel {
    struct Request {
    }

    struct Response {
        let characters: [Character]
    }

    struct ViewModel {
        let characters: [Character]
    }
}
