//
//  CharacterWorker.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation
import UIKit

final class CharacterWorker: CharacterWorkerProtocol {
    var networkManager: NetworkManagerProtocol
    var storageManager: StorageManagerProtocol

    init(networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func getCharacters(completion: @escaping ([Character]) -> Void) {
        if let savedCharacters = storageManager.loadCharacters() {
            completion(savedCharacters)
            return
        }

        networkManager.getCharacters { result in
            switch result {
            case .success(let characters):
                completion(characters)
                self.storageManager.saveCharacters(characters)
            case .failure(let error):
                print("Error fetching characters: \(error)")
                completion([])
            }
        }
    }

    func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void) {
        networkManager.loadImage(from: character.image, completion: completion)
    }
}
