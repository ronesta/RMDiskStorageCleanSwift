//
//  CharacterPresenterProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

protocol CharacterPresenterProtocol {
    func presentCharacters(response: CharacterModel.Response)
    func presentError(_ message: String)
}
