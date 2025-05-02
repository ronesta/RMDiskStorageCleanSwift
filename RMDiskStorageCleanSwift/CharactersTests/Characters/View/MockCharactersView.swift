//
//  MockCharactersView.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

@testable import RMDiskStorageCleanSwift

final class MockCharactersView: CharactersViewProtocol {
    private(set) var displayCharactersCallCount = 0
    private(set) var displayCharactersArgsCharacters = [CharactersModel.ViewModel]()

    private(set) var displayErrorCallCount = 0
    private(set) var displayErrorArgsMessages = String()

    func displayCharacters(viewModel: CharactersModel.ViewModel) {
        displayCharactersCallCount += 1
        displayCharactersArgsCharacters.append(viewModel)
    }

    func displayError(_ message: String) {
        displayErrorCallCount += 1
        displayErrorArgsMessages.append(message)
    }
}
