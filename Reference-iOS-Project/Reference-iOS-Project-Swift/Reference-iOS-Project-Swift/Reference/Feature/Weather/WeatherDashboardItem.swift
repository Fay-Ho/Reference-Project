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

class WeatherDashboardItem: UIView {
    private lazy var temperatureLabel: UILabel = {
        let label: UILabel = .make(text: viewData.temperature)
        label.textAlignment = .center
        return label
    }()
    
    private let viewData: ViewData
    
    init(viewData: ViewData) {
        self.viewData = viewData
        super.init(frame: .zero)
        setupSubviews()
        setupLayout()
        updateStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherDashboardItem {
    func setupSubviews() {
        addSubview(temperatureLabel)
    }
    
    func setupLayout() {
        temperatureLabel
            .vertical(equalTo: self, constant: 100)
            .horizontal(equalTo: self, constant: 50)
    }
    
    func updateStyling() {
        temperatureLabel.font = .boldLarge
    }
}

extension WeatherDashboardItem {
    func updateTemperature(_ temperature: String) {
        temperatureLabel.text = temperature
    }
}

extension WeatherDashboardItem {
    struct ViewData {
        let temperature: String
    }
}
