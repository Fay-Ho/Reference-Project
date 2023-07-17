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

class WeatherViewController : UIViewController {
    var interactor: WeatherInteractorInterface?
    
    private lazy var locationButton: UIImageView = {
        let imageView: UIImageView = .make()
        imageView.isUserInteractionEnabled = true
        
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(nextPage(_:)))
        imageView.addGestureRecognizer(recognizer)
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        layoutSubviews()
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

extension WeatherViewController {
    func setupSubviews() {
        view.addSubview(locationButton)
    }
    
    func layoutSubviews() {
        locationButton
            .top(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24)
            .trailing(equalTo: view.trailingAnchor, constant: -24)
            .width(equalToConstant: 24)
            .height(equalTo: locationButton.widthAnchor)
    }
}

extension WeatherViewController {
    @objc func nextPage(_ sender: Any) {
        interactor?.fetchData()
    }
}

extension WeatherViewController : WeatherViewControllerInterface {
    func showLocationPage(dataModel model: GetCityResponse) {
        guard let navigation = navigationController else { return }
        do {
            let model = try JSONEncoder().encode(model)
            Helper.shared.navigator.navigate(to: .location, from: navigation, dataModel: model)
        } catch {
            return
        }
    }
}
