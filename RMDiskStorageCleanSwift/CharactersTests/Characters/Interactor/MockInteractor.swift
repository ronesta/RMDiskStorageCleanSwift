//
//  MockInteractor.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import XCTest
@testable import RMDiskStorageCleanSwift

final class MockInteractor: CharactersInteractorProtocol {
    private(set) var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
