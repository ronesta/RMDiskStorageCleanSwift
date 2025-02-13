//
//  CharacterAssembly.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation
import UIKit

final class CharacterAssembly {
    static func build() -> UIViewController {
        let storageManager = DiskStorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        let viewController = CharacterViewController()
        let presenter = CharacterPresenter()
        let worker = CharacterWorker(networkManager: networkManager,
                                     storageManager: storageManager
        )
        let interactor = CharactersInteractor(presenter: presenter,
                                              worker: worker
        )

        viewController.interactor = interactor
        presenter.viewController = viewController

        return viewController
    }
}
