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

class WeatherPresenter {
    weak var viewController: WeatherViewControllerInterface?
}

// MARK: - WeatherPresenterInterface Implementation

extension WeatherPresenter : WeatherPresenterInterface {
    func handleCityResponse(_ response: CityResponse) {
        viewController?.showLocationPage(response: response)
    }
    
    func handleWeatherResponse(_ response: WeatherResponse) {
        let listItems = response.list.map {
            WeatherListItemDataModel(
                time: formatDate($0.dt_txt),
                image: $0.weather.first?.main ?? ImageProvider.sun.rawValue,
                weather: String($0.main.temp)
            )
        }
        
        guard let listResponse = response.list.first,
              let weatherResponse = listResponse.weather.first
        else { return }
        
        let dataModel = WeatherDataModel(
            temperature: String(listResponse.main.temp),
            weather: weatherResponse.main,
            wind: String(listResponse.wind.deg),
            listItems: listItems
        )
        
        viewController?.updateDashboardItem(dataModel: dataModel)
    }
    
    func formatDate(_ string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: string) ?? Date()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
