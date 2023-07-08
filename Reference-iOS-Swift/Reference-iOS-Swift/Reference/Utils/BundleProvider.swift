//
//  BundleProvider.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import Foundation

class BundleProvider {
    private static let mock = "Mock.bundle"
    
    static func loadJsonFile(_ fileName: String) -> Data? {
        let filePath = "\(mock)/\(fileName)"
        let path = Bundle.main.path(forResource: filePath, ofType: "json")
        let url = URL(fileURLWithPath: path ?? "")
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            return nil
        }
    }
}
