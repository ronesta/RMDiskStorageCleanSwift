//
//  CharactersInteractorTests.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
@testable import RMDiskStorageCleanSwift

final class CharactersInteractorTests: XCTestCase {
    private var interactor: CharactersInteractor!
    private var mockPresenter: MockPresenter!
    private var mockService: MockCharactersService!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockService = MockCharactersService()
        mockStorageManager = MockStorageManager()
        interactor = CharactersInteractor(
            presenter: mockPresenter,
            charactersService: mockService,
            storageManager: mockStorageManager
        )
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockService = nil
        mockStorageManager = nil
        super.tearDown()
    }

    func test_GivenSavedCharacters_WhenViewDidLoad_ThenPresenterReceivesSavedCharacters() {
        // Given
        let savedCharacters = [
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

        mockStorageManager.saveCharacters(savedCharacters)

        // When
        interactor.viewDidLoad()

        // Then
        let response = CharactersModel.Response(characters: savedCharacters)
        XCTAssertEqual(mockPresenter.presentCharactersCallCount, 1)
        XCTAssertEqual(mockPresenter.presentCharactersArgsResponses.first, response)
        XCTAssertEqual(mockPresenter.presentErrorCallCount, 0)
    }

    func test_GivenNoSavedCharacters_WhenViewDidLoad_ThenPresenterReceivesFetchedCharactersAndSavesThem() {
        // Given
        let fetchedCharacters = [
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

        mockService.stubbedCharactersResult = .success(fetchedCharacters)

        // When
        interactor.viewDidLoad()

        // Then
        let response = CharactersModel.Response(characters: fetchedCharacters)
        XCTAssertEqual(mockPresenter.presentCharactersCallCount, 1)
        XCTAssertEqual(mockPresenter.presentCharactersArgsResponses.first, response)
        XCTAssertEqual(mockPresenter.presentErrorCallCount, 0)
        XCTAssertEqual(mockStorageManager.characters, fetchedCharacters)
    }

    func test_GivenNoSavedCharacters_WhenViewDidLoadFails_ThenPresenterReceivesError() {
        // Given
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        mockService.stubbedCharactersResult = .failure(mockError)

        // When
        interactor.viewDidLoad()

        // Then
        XCTAssertEqual(mockPresenter.presentErrorCallCount, 1)
        XCTAssertEqual(mockPresenter.presentErrorArgsMessages.first, mockError.localizedDescription)
        XCTAssertEqual(mockPresenter.presentCharactersCallCount, 0)
    }
}

