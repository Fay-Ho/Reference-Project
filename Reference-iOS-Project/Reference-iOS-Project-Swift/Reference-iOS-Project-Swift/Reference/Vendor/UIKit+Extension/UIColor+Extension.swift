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

extension UIColor {
    public convenience init(hex: String) {
        var string = hex.replacingOccurrences(of: "#", with: "")
        if string.count == 6 {
            string += "ff"
        }
        let scanner = Scanner(string: string)
        var number: UInt64 = 0
        scanner.scanHexInt64(&number)
        
        let red = CGFloat((number & 0xff000000) >> 24) / 255
        let green = CGFloat((number & 0x00ff0000) >> 16) / 255
        let blue = CGFloat((number & 0x0000ff00) >> 8) / 255
        let alpha = CGFloat((number & 0x000000ff) >> 0) / 255
            
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
