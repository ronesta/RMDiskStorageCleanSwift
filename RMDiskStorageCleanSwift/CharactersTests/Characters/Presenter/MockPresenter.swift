//
//  MockPresenter.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
@testable import RMDiskStorageCleanSwift

final class MockPresenter: CharactersPresenterProtocol {
    private(set) var presentCharactersCallCount = 0
    private(set) var presentCharactersArgsResponses = [CharactersModel.Response]()

    private(set) var presentErrorCallCount = 0
    private(set) var presentErrorArgsMessages = [String]()

    func presentCharacters(response: CharactersModel.Response) {
        presentCharactersCallCount += 1
        presentCharactersArgsResponses.append(response)
    }

    func presentError(_ message: String) {
        presentErrorCallCount += 1
        presentErrorArgsMessages.append(message)
    }
}
