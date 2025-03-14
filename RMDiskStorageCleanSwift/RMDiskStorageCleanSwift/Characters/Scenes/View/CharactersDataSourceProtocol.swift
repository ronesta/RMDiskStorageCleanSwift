//
//  CharactersDataSourceProtocol.swift
//  RMDiskStorageCleanSwift
//
//  Created by Ибрагим Габибли on 14.03.2025.
//

import Foundation
import UIKit

protocol CharactersDataSourceProtocol: UITableViewDataSource {
    var characters: [Character] { get set }
}
