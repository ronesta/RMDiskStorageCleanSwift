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
    func testGivenCharacters_WhenUpdated_ThenViewControllerAppearanceMatchesSnapshot() {
        // Given
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

        // When
        viewController.loadViewIfNeeded()
        let viewModel = CharactersModel.ViewModel(characters: characters)

        viewController.displayCharacters(viewModel: viewModel)

        // Then
        assertSnapshot(of: navigationController, as: .image)
    }
}
