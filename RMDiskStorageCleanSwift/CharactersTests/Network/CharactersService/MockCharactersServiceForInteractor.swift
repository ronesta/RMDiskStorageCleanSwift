//
//  MockCharactersServiceForInteractor.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import Foundation
@testable import RMDiskStorageCleanSwift

final class MockCharactersServiceForInteractor: CharactersServiceProtocol {
    var resultToReturn: Result<[Character], Error>?

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        if let result = resultToReturn {
            completion(result)
        }
    }
}
