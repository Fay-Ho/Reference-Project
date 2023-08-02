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

enum ImageProvider : String {
    case cloudy = "Clouds"
    case foggy = "大雾"
    case hail = "冰雹"
    case location = "定位"
    case moon = "夜间"
    case moonCloudy = "夜间多云"
    case rainy = "Rain"
    case snowy = "雪天"
    case sun = "晴朗"
    case sunCloudy = "晴朗多云"
    case thunderstorms = "雷暴"
    case tornado = "龙卷风"
    case typhoon = "台风"
    
//    var image: UIImage? {
//        switch self {
//        case .cloudy: return UIImage(named: "ImgCloudy")
//        case .foggy: return UIImage(named: "ImgFoggy")
//        case .hail: return UIImage(named: "ImgHail")
//        case .location: return UIImage(named: "ImgLocation")
//        case .moon: return UIImage(named: "ImgMoon")
//        case .moonCloudy: return UIImage(named: "ImgMoonCloudy")
//        case .rainy: return UIImage(named: "ImgRainy")
//        case .snowy: return UIImage(named: "ImgSnowy")
//        case .sun: return UIImage(named: "ImgSun")
//        case .sunCloudy: return UIImage(named: "ImgSunCloudy")
//        case .thunderstorms: return UIImage(named: "ImgThunderstorms")
//        case .tornado: return UIImage(named: "ImgTornado")
//        case .typhoon: return UIImage(named: "ImgTyphoon")
//        }
//    }

    func loadImage() -> UIImage? {
        switch self {
        case .cloudy: return UIImage(named: "ImgCloudy")
        case .foggy: return UIImage(named: "ImgFoggy")
        case .hail: return UIImage(named: "ImgHail")
        case .location: return UIImage(named: "ImgLocation")
        case .moon: return UIImage(named: "ImgMoon")
        case .moonCloudy: return UIImage(named: "ImgMoonCloudy")
        case .rainy: return UIImage(named: "ImgRainy")
        case .snowy: return UIImage(named: "ImgSnowy")
        case .sun: return UIImage(named: "ImgSun")
        case .sunCloudy: return UIImage(named: "ImgSunCloudy")
        case .thunderstorms: return UIImage(named: "ImgThunderstorms")
        case .tornado: return UIImage(named: "ImgTornado")
        case .typhoon: return UIImage(named: "ImgTyphoon")
        }
    }
}
