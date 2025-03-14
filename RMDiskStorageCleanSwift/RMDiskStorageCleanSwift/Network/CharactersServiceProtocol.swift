//
//  NetworkManagerProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 13.02.2025.
//

import Foundation

protocol CharactersServiceProtocol {
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void)
}
