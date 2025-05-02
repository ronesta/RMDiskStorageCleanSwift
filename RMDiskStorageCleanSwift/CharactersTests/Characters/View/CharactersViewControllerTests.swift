//
//  CharactersViewControllerTests.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
import ViewControllerPresentationSpy
@testable import RMDiskStorageCleanSwift

final class CharactersViewControllerTests: XCTestCase {
    private var viewController: CharactersViewController!
    private var mockInteractor: MockInteractor!
    private var mockDataSource: MockDataSource!

    override func setUp() {
        super.setUp()
        mockInteractor = MockInteractor()
        mockDataSource = MockDataSource()
        viewController = CharactersViewController(interactor: mockInteractor,
                                                  dataSource: mockDataSource
        )

    }

    override func tearDown() {
        viewController = nil
        mockInteractor = nil
        mockDataSource = nil
        super.tearDown()
    }

    func testGivenViewController_WhenViewDidLoad_ThenInteractorViewDidLoadIsCalled() {
        // Given
        // ViewController initialized with mockInteractor & mockDataSource

        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertTrue(mockInteractor.viewDidLoadCalled)
    }

    func testGivenViewController_WhenViewDidLoad_ThenTableViewIsConfigured() {
        // Given
        // ViewController initialized with mockInteractor & mockDataSource

        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.tableView.dataSource === mockDataSource)

        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertTrue(viewController.tableView.delegate === viewController)
    }

    func testGivenCharacters_WhenDisplayCharacters_ThenDataSourceIsUpdated() {
        // Given
        let characters = [
            Character(name: "John Doe",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth"),
                      image: "image_url"
                     ),
            Character(name: "Morty Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )
        ]

        // When
        let viewModel = CharactersModel.ViewModel(characters: characters)

        viewController.displayCharacters(viewModel: viewModel)

        // Then
        XCTAssertEqual(mockDataSource.characters, characters)
    }

    @MainActor func testGivenErrorMessage_WhenShowError_ThenDisplaysAlert() {
        // Given
        let errorMessage = "Test Error"
        let alertVerifier = AlertVerifier()

        // When
        viewController.displayError(errorMessage)

        // Then
        alertVerifier.verify(
            title: "Error",
            message: "Test Error",
            animated: true,
            actions: [
                .default("OK")
            ],
            presentingViewController: viewController
        )
    }
}
