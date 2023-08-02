//
//  WeatherListItem.swift
//  Reference-iOS-Project-Swift
//
//  Created by Fay on 2023/7/28.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class WeatherListItem: UIView {
    private lazy var root: UIScrollView = {
        let view: UIScrollView = .make()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.contentSize = CGSize(width: view.frame.width, height: 0)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var container: UIStackView = {
        .make(spacing: 10, axis: .horizontal)
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupLayouts()
        updateStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherListItem {
    func setupSubviews() {
        addSubview(root)
        root.addSubview(container)
    }
    
    func setupLayouts() {
        root
            .top(equalTo: topAnchor, constant: 16)
            .bottom(equalTo: bottomAnchor)
            .horizontal(equalTo: self, constant: 16)
        
        container
            .edge(equalTo: root)
            .height(equalTo: root.heightAnchor)
    }
    
    func updateStyling() {
        root.backgroundColor = .item
    }
}

extension WeatherListItem {
    func update(dataModels: [WeatherListItemDataModel]) {
        let cells = dataModels.map { dataModel -> WeatherListItemCell in
            return .init(viewModel: .init(time: dataModel.time, image: dataModel.image, weather: dataModel.weather))
        }
        container.addSubviews(cells)
    }
}
