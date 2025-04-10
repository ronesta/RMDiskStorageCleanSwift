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
    private var mockService: MockCharactersServiceForInteractor!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockService = MockCharactersServiceForInteractor()
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

    func testGetCharactersLoadSavedCharacters() {
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

        interactor.viewDidLoad()

        XCTAssertEqual(mockPresenter.charactersPassed?.characters, savedCharacters)
        XCTAssertNil(mockPresenter.errorMessage)
    }

    func testGetCharactersWhenCharactersAreNotSaved() {
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

        mockService.resultToReturn = .success(fetchedCharacters)
        interactor.viewDidLoad()

        XCTAssertEqual(mockPresenter.charactersPassed?.characters, fetchedCharacters)
        XCTAssertNil(mockPresenter.errorMessage)
        XCTAssertEqual(mockStorageManager.characters, fetchedCharacters)
    }

    func testGetCharactersSendsErrorToPresenterWhenServiceFails() {
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        mockService.resultToReturn = .failure(mockError)

        interactor.viewDidLoad()

        XCTAssertNotNil(mockPresenter.errorMessage)
        XCTAssertNil(mockPresenter.charactersPassed)
        XCTAssertEqual(mockPresenter.errorMessage, mockError.localizedDescription)
    }
}

