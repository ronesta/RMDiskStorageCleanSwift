//
//  CharactersInteractor.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation
import UIKit

final class CharactersInteractor: CharactersInteractorProtocol {
    private let presenter: CharactersPresenterProtocol
    private let charactersService: CharactersServiceProtocol
    private let storageManager: StorageManagerProtocol

    init(presenter: CharactersPresenterProtocol,
         charactersService: CharactersServiceProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.presenter = presenter
        self.charactersService = charactersService
        self.storageManager = storageManager
    }

    func viewDidLoad() {
        getCharacters(request: CharactersModel.Request())
    }

    private func getCharacters(request: CharactersModel.Request) {
        if let savedCharacters = storageManager.loadCharacters() {
            let response = CharactersModel.Response(characters: savedCharacters)
            self.presenter.presentCharacters(response: response)
            return
        }

        charactersService.getCharacters { result in
            switch result {
            case .success(let characters):
                let response = CharactersModel.Response(characters: characters)
                self.presenter.presentCharacters(response: response)
                self.storageManager.saveCharacters(characters)
            case .failure(let error):
                self.presenter.presentError(error.localizedDescription)
                print("Error fetching characters: \(error)")
            }
        }
    }
}
