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

class WeatherViewController : BaseViewController {
    var interactor: WeatherInteractorInterface?
    
    // MARK: - UI Component
    
    private lazy var locationButton: UIImageView = {
        let imageView: UIImageView = .make(image: UIImage(named: "ImgLocation"))
        imageView.isUserInteractionEnabled = true
        
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(nextPage(_:)))
        imageView.addGestureRecognizer(recognizer)
        
        return imageView
    }()
    
    private lazy var dashboardItem: WeatherDashboardItem = {
        let dataModel = WeatherDashboardItem.ViewModel(temperature: nil, weather: nil, wind: nil)
        let item = WeatherDashboardItem(viewModel: dataModel)
        return item
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupLayouts()
        updateStyling()
        interactor?.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Subview Management

extension WeatherViewController {
    func setupSubviews() {
        view.addSubview(locationButton)
        container.addArrangedSubview(dashboardItem)
    }
    
    func setupLayouts() {
        locationButton
            .top(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            .trailing(equalTo: view.trailingAnchor, constant: -24)
            .width(equalToConstant: 24)
            .height(equalTo: locationButton.widthAnchor)
    }
    
    func updateStyling() {
        view.backgroundColor = .wallpaper
    }
}

// MARK: - Event Management

extension WeatherViewController {
    @objc func nextPage(_ sender: Any) {
        interactor?.fetchCityData()
    }
}

// MARK: - WeatherViewControllerInterface Implementation

extension WeatherViewController : WeatherViewControllerInterface {
    func updateDashboardItem(dataModel: WeatherDataModel) {
        let viewModel = WeatherDashboardItem.ViewModel(
            temperature: dataModel.temperature,
            weather: dataModel.weather,
            wind: dataModel.wind
        )
        dashboardItem.update(viewModel: viewModel)
    }
    
    func showLocationPage(dataModel: Codable) {
        guard let navigation = navigationController else { return }
        navigator?.navigate(to: .location, from: navigation, dataModel: dataModel)
    }
}
