//
//  MockURLSessionDataTask.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 02.05.2025.
//

import Foundation
@testable import RMDiskStorageCleanSwift

final class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private let completion: (() -> Void)?
    private(set) var resumeCallCount = 0

    init(completion: (() -> Void)?) {
        self.completion = completion
    }

    func resume() {
        resumeCallCount += 1
        completion?()
    }
}
