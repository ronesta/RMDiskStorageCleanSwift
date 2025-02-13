//
//  CharacterViewProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

protocol CharacterViewProtocol: AnyObject {
    func displayCharacters(viewModel: CharacterModel.ViewModel)
    func displayError(_ message: String)
}
