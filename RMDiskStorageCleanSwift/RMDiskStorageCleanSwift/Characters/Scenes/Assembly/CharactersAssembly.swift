//
//  CharacterAssembly.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation
import UIKit

final class CharactersAssembly {
    func createModule() -> UIViewController {
        let storageManager = DiskStorageManager()
        let charactersService = CharactersService()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let presenter = CharactersPresenter()
        let interactor = CharactersInteractor(presenter: presenter,
                                              charactersService: charactersService,
                                              storageManager: storageManager
        )

        let tableViewDataSource = CharactersTableViewDataSource(imageLoader: imageLoader)

        let viewController = CharactersViewController(
            interactor: interactor,
            dataSource: tableViewDataSource
        )

        presenter.viewController = viewController

        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
