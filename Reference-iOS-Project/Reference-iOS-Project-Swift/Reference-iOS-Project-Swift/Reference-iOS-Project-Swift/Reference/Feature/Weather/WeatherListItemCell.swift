//
//  WeatherListItemCell.swift
//  Reference-iOS-Project-Swift
//
//  Created by Fay on 2023/7/28.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class WeatherListItemCell: UIView {
    let viewModel: ViewModel
    
    private lazy var imageView: UIImageView = {
        return .make(image: viewModel.image?.loadImage())
    }()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherListItemCell {
    struct ViewModel {
        let time: String
        let image: ImageProvider?
        let weather: String
    }
}
