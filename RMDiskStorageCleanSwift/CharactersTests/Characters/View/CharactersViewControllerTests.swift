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

    func testViewDidLoadCallsInteractorViewDidLoad() {
        viewController.viewDidLoad()

        XCTAssertTrue(mockInteractor.viewDidLoadCalled)

    }

    func testSetupViews() {
        viewController.viewDidLoad()

        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.tableView.dataSource === mockDataSource)

        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertTrue(viewController.tableView.delegate === viewController)
    }

    func testDisplayCharactersReloadsData() {
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

        let viewModel = CharactersModel.ViewModel(characters: characters)

        viewController.displayCharacters(viewModel: viewModel)

        XCTAssertEqual(mockDataSource.characters, characters)
    }

    @MainActor func testDisplayErrorShowsAlert() {
        let errorMessage = "Test Error"
        let alertVerifier = AlertVerifier()

        viewController.displayError(errorMessage)

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
