//
//  CharactersPresenterTests.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
@testable import RMDiskStorageCleanSwift

final class CharactersPresenterTests: XCTestCase {
    private var presenter: CharactersPresenter!
    private var mockView: MockCharactersView!

    override func setUp() {
        super.setUp()
        mockView = MockCharactersView()
        presenter = CharactersPresenter()
        presenter.viewController = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        super.tearDown()
    }

    func testGivenValidCharacters_WhenPresentCharactersCalled_ThenViewIsUpdatedWithCharacters() {
        let mockCharacters = [
            Character(name: "Summer Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     ),
            Character(name: "Beth Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )
        ]

        let response = CharactersModel.Response(characters: mockCharacters)
        presenter.presentCharacters(response: response)

        // Then
        XCTAssertEqual(mockView.displayCharactersCallCount, 1)
        XCTAssertEqual(mockView.displayCharactersArgsCharacters.first?.characters, response.characters)
        XCTAssertEqual(mockView.displayErrorCallCount, 0)
    }

    func testGivenFetchFailure_WhenCharactersFetchFailed_ThenErrorIsShownInView() {
        // Given
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        // When
        presenter.presentError(mockError.localizedDescription)

        // Then
        XCTAssertEqual(mockView.displayErrorCallCount, 1)
        XCTAssertEqual(mockView.displayCharactersCallCount, 0)

    }
}
