//
//  MockCharactersView.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

@testable import RMDiskStorageCleanSwift

final class MockCharactersView: CharactersViewProtocol {
    private(set) var viewModelPassed: CharactersModel.ViewModel?
    private(set) var errorMessagePassed: String?

    func displayCharacters(viewModel: CharactersModel.ViewModel) {
        viewModelPassed = viewModel
    }

    func displayError(_ message: String) {
        errorMessagePassed = message
    }
}
