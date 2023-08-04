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
    private var viewModel: ViewModel?
    
    // MARK: - UI Component
    
    private lazy var container: UIView = {
        let view: UIView = .make()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var temperatureLabel: UILabel = {
        .make(text: nil, textAlignment: .center)
    }()
    
    private lazy var celsiusLabel: UILabel = {
        .make(text: "°C", textAlignment: .natural)
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label: UILabel = .make(text: nil, textAlignment: .center)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var windLabel: UILabel = {
        let label: UILabel = .make(text: nil, textAlignment: .center)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    
    // MARK: - Lifecycle
    
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

// MARK: - Subview Management

extension WeatherDashboardItem {
    func setupSubviews() {
        addSubview(container)
        container.addSubviews([temperatureLabel, celsiusLabel, weatherLabel, windLabel])
    }
    
    func setupLayouts() {
        container
            .topEqualTo(anchor: topAnchor, constant: 60)
            .bottomEqualTo(anchor: bottomAnchor, constant: 10)
            .horizontalEqualTo(view: self, constant: 16)
        
        temperatureLabel
            .vertical(equalTo: container, constant: 100)
            .horizontalEqualTo(view: container, constant: 135)
        
        celsiusLabel
            .topEqualTo(anchor: container.topAnchor, constant: 100)
            .leading(equalTo: temperatureLabel.trailingAnchor)
        
        weatherLabel
            .topEqualTo(anchor: temperatureLabel.bottomAnchor, constant: 10)
            .centerX(equalTo: container.centerXAnchor, constant: -50)
        
        windLabel
            .topEqualTo(anchor: temperatureLabel.bottomAnchor, constant: 10)
            .centerX(equalTo: container.centerXAnchor, constant: 50)
    }
    
    func updateStyling() {
        container.backgroundColor = .item
        
        temperatureLabel.font = .size80
        temperatureLabel.textColor = .font
        
        celsiusLabel.font = .size30
        celsiusLabel.textColor = .font
        
        weatherLabel.font = .size16
        weatherLabel.textColor = .font
        
        windLabel.font = .size16
        windLabel.textColor = .font
    }
}

// MARK: -

extension WeatherDashboardItem {
    func update(viewModel: ViewModel) {
        temperatureLabel.text = viewModel.temperature
        weatherLabel.text = viewModel.weather
        windLabel.text = viewModel.wind
    }
}

// MARK: - Data Model

extension WeatherDashboardItem {
    struct ViewModel {
        let temperature: String?
        let weather: String?
        let wind: String?
    }
}
