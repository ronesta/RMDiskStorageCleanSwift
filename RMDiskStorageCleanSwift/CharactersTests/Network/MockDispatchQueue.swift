//
//  MockDispatchQueue.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 02.05.2025.
//

import Foundation
@testable import RMDiskStorageCleanSwift

final class MockDispatchQueue: DispatchQueueProtocol {
    func async(_ block: @escaping () -> Void) {
        block()
    }
}
