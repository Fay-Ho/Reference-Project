//
//  CityInteractor.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

class CityInteractor {
    var presenter: CityPresenterInterface?
}

extension CityInteractor: CityInteractorInterface {
    func fetchData() {
        let manager = NetworkManager()
        manager.getCity { [weak self] in
            guard let response = $0 else { return }
            self?.presenter?.handle(response: response)
        }
    }
}
