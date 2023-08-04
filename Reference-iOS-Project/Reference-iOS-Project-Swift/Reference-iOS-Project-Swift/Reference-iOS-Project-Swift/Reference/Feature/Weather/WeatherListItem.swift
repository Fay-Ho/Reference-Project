//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
            .topEqualTo(anchor: topAnchor, constant: 16)
            .bottomEqualTo(anchor: bottomAnchor)
            .horizontalEqualTo(view: self, constant: 16)
        
        container
            .edgeEqualTo(view: root)
            .heightEqualTo(anchor: root.heightAnchor)
    }
    
    func updateStyling() {
        root.backgroundColor = .item
    }
}

extension WeatherListItem {
    func update(dataModels: [WeatherListItemDataModel]) {
        let cells = dataModels.map { dataModel -> WeatherListItemCell in
            return .init(viewModel: .init(title: dataModel.time, image: dataModel.image, content: dataModel.weather))
        }
        container.addArrangedSubviews(cells)
    }
}
