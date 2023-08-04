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

class WeatherListItemCell: UIView {
    let viewModel: ViewModel
    
    private lazy var container: UIStackView = {
        .make(spacing: 20)
    }()
    
    private lazy var titleLabel: UILabel = {
        .make(text: viewModel.title, textAlignment: .center)
    }()
    
    private lazy var imageContainer: UIView = {
        .make()
    }()
    
    private lazy var imageView: UIImageView = {
        .make(image: ImageProvider(rawValue: viewModel.image)?.loadImage())
    }()
    
    private lazy var contentLabel: UILabel = {
        .make(text: viewModel.content, textAlignment: .center)
    }()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupSubviews()
        setupLayouts()
        updateStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherListItemCell {
    func setupSubviews() {
        addSubview(container)
        container.addArrangedSubviews([titleLabel, imageContainer, contentLabel])
        imageContainer.addSubview(imageView)
    }
    
    func setupLayouts() {
        container
            .edgeEqualTo(view: self)
            .widthEqualTo(anchor: widthAnchor)
        
        imageView
            .centerEqualTo(view: imageContainer)
            .widthEqualTo(constant: 36)
            .heightEqualTo(anchor: imageView.widthAnchor)
    }
    
    func updateStyling() {
        titleLabel.textColor = .font
        contentLabel.textColor = .font
    }
}

extension WeatherListItemCell {
    struct ViewModel {
        let title: String
        let image: String
        let content: String
    }
}
