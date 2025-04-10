//
//  MockPresenter.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
@testable import RMDiskStorageCleanSwift

final class MockPresenter: CharactersPresenterProtocol {
    var charactersPassed: CharactersModel.Response?
    var errorMessage: String?

    func presentCharacters(response: CharactersModel.Response) {
        charactersPassed = response
    }

    func presentError(_ message: String) {
        errorMessage = message
    }
}
