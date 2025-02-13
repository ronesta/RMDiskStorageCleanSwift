//
//  CharacterInteractorProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation
import UIKit

protocol CharacterInteractorProtocol {
    func getCharacters(request: CharacterModel.Request)
    func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void)
}
