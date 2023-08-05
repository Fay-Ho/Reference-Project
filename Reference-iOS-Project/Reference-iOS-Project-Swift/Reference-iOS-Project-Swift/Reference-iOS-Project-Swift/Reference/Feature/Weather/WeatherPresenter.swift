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
    private enum Pattern : String {
        case dateTime = "yyyy-MM-dd HH:mm:ss"
        case time = "HH:mm"
    }
    
    weak var viewController: WeatherViewControllerInterface?
    
    private func makeListItems(_ response: WeatherResponse) -> [WeatherListItemDataModel] {
        response.list.map {
            .init(
                time: formatDate($0.dt_txt),
                image: $0.weather.first?.main ?? "",
                weather: formatDouble($0.main.temp)
            )
        }
    }
    
    private func formatDate(_ string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Pattern.dateTime.rawValue
        let date = formatter.date(from: string) ?? Date()
        formatter.dateFormat = Pattern.time.rawValue
        return formatter.string(from: date)
    }
    
    private func formatDouble(_ value: Double) -> String {
        .init(format: "%.f", ceil(value))
    }
}

// MARK: - WeatherPresenterInterface Implementation

extension WeatherPresenter : WeatherPresenterInterface {
    func handleCityResponse(_ response: CityResponse) {
        viewController?.showLocationPage(response: response)
    }
    
    func handleWeatherResponse(_ response: WeatherResponse) {
        guard let listResponse = response.list.first,
              let weatherResponse = listResponse.weather.first
        else { return }
        
        viewController?.updateDashboardItem(
            dataModel: .init(
                temperature: formatDouble(listResponse.main.temp),
                weather: weatherResponse.main,
                wind: String(listResponse.wind.deg),
                listItems: makeListItems(response)
            )
        )
    }
}
