//
//  CharacterPresenter.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

final class CharactersPresenter: CharactersPresenterProtocol {
    weak var viewController: CharactersViewProtocol?

    func presentCharacters(response: CharactersModel.Response) {
        let viewModel = CharactersModel.ViewModel(characters: response.characters)
        viewController?.displayCharacters(viewModel: viewModel)
    }

    func presentError(_ message: String) {
        viewController?.displayError(message)
    }
}
