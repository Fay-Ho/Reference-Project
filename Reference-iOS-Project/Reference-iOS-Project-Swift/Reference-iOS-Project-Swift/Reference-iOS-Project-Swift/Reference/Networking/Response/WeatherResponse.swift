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

struct WeatherResponse : Codable {
    let city: WeatherCityResponse
    let cnt: Int
    let cod: String
    let list: [WeatherListResponse]
    let message: Int
}

struct WeatherCityResponse : Codable {
    let coord: WeatherCityCoordResponse
    let country: String
    let id: Int
    let name: String
    let population: Int
    let sunrise: Int
    let sunset: Int
    let timezone: Int
}

struct WeatherCityCoordResponse : Codable {
    let lat: Double
    let lon: Double
}

struct WeatherListResponse : Codable {
    let clouds: WeatherListCloudsResponse
    let dt: Int
    let dt_txt: String
    let main: WeatherListMainResponse
    let pop: Double
    let rain: WeatherListRainResponse?
    let sys: WeatherListSysResponse
    let visibility: Int
    let weather: [WeatherListWeatherResponse]
    let wind: WeatherListWindResponse
}

struct WeatherListCloudsResponse : Codable {
    let all: Int
}

struct WeatherListMainResponse : Codable {
    let feels_like: Double
    let grnd_level: Int
    let humidity: Int
    let pressure: Int
    let sea_level: Int
    let temp: Double
    let temp_kf: Double
    let temp_max: Double
    let temp_min: Double
}

struct WeatherListRainResponse : Codable {
    let h: Double
    
    enum CodingKeys : String, CodingKey {
        case h = "3h"
    }
}

struct WeatherListSysResponse : Codable {
    let pod: String
}

struct WeatherListWeatherResponse : Codable {
    let description: String
    let icon: String
    let id: Int
    let main: String
}

struct WeatherListWindResponse : Codable {
    let deg: Int
    let gust: Double
    let speed: Double
}
