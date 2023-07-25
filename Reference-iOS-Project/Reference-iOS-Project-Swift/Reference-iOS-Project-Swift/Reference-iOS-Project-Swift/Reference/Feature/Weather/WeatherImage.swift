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

enum WeatherImage : String {
    case cloudy = "阴天"
    case foggy = "大雾"
    case hail = "冰雹"
    case moon = "夜间"
    case moonCloudy = "夜间多云"
    case rainy = "雨天"
    case snowy = "雪天"
    case sun = "晴朗"
    case sunCloudy = "晴朗多云"
    case thunderstorms = "雷暴"
    case tornado = "龙卷风"
    case typhoon = "台风"
    
    var fileName: String {
        switch self {
        case .cloudy:
            return "ImgCloudy"
        case .foggy:
            return "ImgFoggy"
        case .hail:
            return "ImgHail"
        case .moon:
            return "ImgMoon"
        case .moonCloudy:
            return "ImgMoonCloudy"
        case .rainy:
            return "ImgRainy"
        case .snowy:
            return "ImgSnowy"
        case .sun:
            return "ImgSun"
        case .sunCloudy:
            return "ImgSunCloudy"
        case .thunderstorms:
            return "ImgThunderstorms"
        case .tornado:
            return "ImgTornado"
        case .typhoon:
            return "ImgTyphoon"
        }
    }
    
//    func fileName() -> String {
//        switch self {
//        case .cloudy:
//            return "ImgCloudy"
//        case .foggy:
//            return "ImgFoggy"
//        case .hail:
//            return "ImgHail"
//        case .moon:
//            return "ImgMoon"
//        case .moonCloudy:
//            return "ImgMoonCloudy"
//        case .rainy:
//            return "ImgRainy"
//        case .snowy:
//            return "ImgSnowy"
//        case .sun:
//            return "ImgSun"
//        case .sunCloudy:
//            return "ImgSunCloudy"
//        case .thunderstorms:
//            return "ImgThunderstorms"
//        case .tornado:
//            return "ImgTornado"
//        case .typhoon:
//            return "ImgTyphoon"
//        }
//    }
}
