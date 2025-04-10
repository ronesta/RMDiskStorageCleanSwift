//
//  MockImageLoader.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import UIKit
@testable import RMDiskStorageCleanSwift

final class MockImageLoader: ImageLoaderProtocol {
    var mockImage: UIImage?
    var shouldReturnError: Bool = false

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            completion(mockImage)
        }
    }
}
