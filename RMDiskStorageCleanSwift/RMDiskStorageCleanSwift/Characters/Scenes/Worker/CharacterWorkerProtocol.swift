//
//  CharacterWorkerProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation
import UIKit

protocol CharacterWorkerProtocol {
    func getCharacters(completion: @escaping ([Character]) -> Void)
    func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void)
}
