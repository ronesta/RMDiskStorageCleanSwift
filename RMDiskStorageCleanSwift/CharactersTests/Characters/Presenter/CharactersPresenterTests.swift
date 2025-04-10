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

    func testPresentCharactersShouldFormatDataForDisplay() {
        let characters = [
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

        let response = CharactersModel.Response(characters: characters)
        presenter.presentCharacters(response: response)

        XCTAssertEqual(mockView.viewModelPassed?.characters, characters)
    }

    func testCharactersFetchFailedShowsErrorInView() {
        let error = NSError(domain: "Test", code: 0, userInfo: nil)

        presenter.presentError(error.localizedDescription)

        XCTAssertNotNil(mockView.errorMessagePassed)
        XCTAssertNil(mockView.viewModelPassed)
        XCTAssertEqual(mockView.errorMessagePassed, error.localizedDescription)

    }
}
