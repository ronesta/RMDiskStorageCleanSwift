//
//  CharacterPresenterProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

protocol CharactersPresenterProtocol {
    func presentCharacters(response: CharactersModel.Response)
    
    func presentError(_ message: String)
}
