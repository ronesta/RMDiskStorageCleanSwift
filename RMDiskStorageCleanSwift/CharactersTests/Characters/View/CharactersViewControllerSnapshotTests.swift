//
//  CharactersViewControllerSnapshotTests.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
import SnapshotTesting
@testable import RMDiskStorageCleanSwift

final class CharactersViewControllerSnapshotTests: XCTestCase {
    func testCharactersViewControllerDefaultAppearance() {
        let interactor = MockInteractor()
        let dataSource = MockDataSource()

        let viewController = CharactersViewController(interactor: interactor,
                                                      dataSource: dataSource
        )
        let navigationController = UINavigationController(rootViewController: viewController)

        let characters = [
            Character(name: "John Doe",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth"),
                      image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
                     ),
            Character(name: "Morty Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth (C-137)"),
                      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
                     )
        ]

        viewController.loadViewIfNeeded()
        let viewModel = CharactersModel.ViewModel(characters: characters)

        viewController.displayCharacters(viewModel: viewModel)

        assertSnapshot(of: navigationController, as: .image)
    }

    func testCharactersViewControllerErrorAppearance() {
        let interactor = MockInteractor()
        let dataSource = MockDataSource()

        let viewController = CharactersViewController(interactor: interactor,
                                                      dataSource: dataSource
        )
        let navigationController = UINavigationController(rootViewController: viewController)

        viewController.displayError("An error occurred")
        viewController.loadViewIfNeeded()

        assertSnapshot(of: navigationController, as: .image)
    }
}
