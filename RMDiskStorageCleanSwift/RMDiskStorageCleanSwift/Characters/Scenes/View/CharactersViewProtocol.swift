//
//  CharacterViewProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

protocol CharactersViewProtocol: AnyObject {
    func displayCharacters(viewModel: CharactersModel.ViewModel)

    func displayError(_ message: String)
}
