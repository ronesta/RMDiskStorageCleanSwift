//
//  CharacterPresenter.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

final class CharacterPresenter: CharacterPresenterProtocol {
    weak var viewController: CharacterViewProtocol?

    func presentCharacters(response: CharacterModel.Response) {
        let viewModel = CharacterModel.ViewModel(characters: response.characters)
        viewController?.displayCharacters(viewModel: viewModel)
    }

    func presentError(_ message: String) {
        viewController?.displayError(message)
    }
}
