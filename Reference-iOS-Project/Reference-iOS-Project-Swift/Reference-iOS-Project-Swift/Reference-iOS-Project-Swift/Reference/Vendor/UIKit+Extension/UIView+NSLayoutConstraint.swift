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

extension UIView {
    /**
     Align the top anchor of current view and target view.
     
     ```
     // example 1:
     view1.topEqualTo(anchor: view2.topAnchor)
     
     // example 2:
     view1.topEqualTo(anchor: view2.topAnchor, constant: 16)
     ```
     
     - Parameters:
     - anchor: The target view top anchor
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func topEqualTo(anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Align the bottom anchor of current view and target view.
     
     ```
     // example 1:
     view1.bottomEqualTo(anchor: view2.bottomAnchor)
     
     // example 2:
     view1.bottomEqualTo(anchor: view2.bottomAnchor, constant: -16)
     ```
     
     - Parameters:
     - anchor: The target view bottom anchor
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func bottomEqualTo(anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Align the leading anchor of current view and target view.
     
     ```
     // example 1:
     view1.leadingEqualTo(anchor: view2.leadingAnchor)
     
     // example 2:
     view1.leadingEqualTo(anchor: view2.leadingAnchor, constant: 16)
     ```
     
     - Parameters:
     - anchor: The target view leading anchor
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func leadingEqualTo(anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Align the trailingEqualTo anchor of current view and target view.
     
     ```
     // example 1:
     view1.trailingEqualTo(anchor: view2.trailingAnchor)
     
     // example 2:
     view1.trailingEqualTo(anchor: view2.trailingAnchor, constant: -16)
     ```
     
     - Parameters:
     - anchor: The target view trailing anchor
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func trailingEqualTo(anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Align the top anchor and  bottom anchor of current view and target view.
     
     ```
     // example 1:
     view1.verticalEqualTo(view: view2)
     
     // example 2:
     view1.verticalEqualTo(view: view2, constant: 16)
     
     // example 3:
     view1.verticalEqualTo(view: view2, constant: 16, safeArea: true)
     ```
     
     - Parameters:
     - view: The target view
     - constant: The distance from the target view
     - safeArea: Is using safe area layout guide
     
     - Returns:
     The current view
     */
    @discardableResult
    func verticalEqualTo(view: UIView, constant: CGFloat = 0, safeArea: Bool = false) -> UIView {
        topEqualTo(anchor: safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor, constant: abs(constant))
        bottomEqualTo(anchor: safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor, constant: -abs(constant))
        return self
    }
    
    /**
     Align the leading anchor and trailing anchor of current view and target view.
     
     ```
     // example 1:
     view1.horizontalEqualTo(view: view2)
     
     // example 2:
     view1.horizontalEqualTo(view: view2, constant: 16)
     
     // example 3:
     view1.horizontalEqualTo(view: view2, constant: 16, safeArea: true)
     ```
     
     - Parameters:
     - anchor: The target view
     - constant: The distance from the target view
     - safeArea: Is using safe area layout guide
     
     - Returns:
     The current view
     */
    @discardableResult
    func horizontalEqualTo(view: UIView, constant: CGFloat = 0, safeArea: Bool = false) -> UIView {
        leadingEqualTo(anchor: safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor, constant: abs(constant))
        trailingEqualTo(anchor: safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor, constant: -abs(constant))
        return self
    }
    
    /**
     Align the center x anchor of current view and target view.
     
     ```
     // example 1:
     view1.centerXEqualTo(anchor: view2.centerXAnchor)
     
     // example 2:
     view1.centerXEqualTo(anchor: view2.centerXAnchor, constant: 16)
     ```
     
     - Parameters:
     - anchor: The target view center x anchor
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func centerXEqualTo(anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Align the center y anchor of current view and target view.
     
     ```
     // example 1:
     view1.centerYEqualTo(anchor: view2.centerYAnchor)
     
     // example 2:
     view1.centerYEqualTo(anchor: view2.centerYAnchor, constant: 16)
     ```
     
     - Parameters:
     - anchor: The target view center y anchor
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func centerYEqualTo(anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> UIView {
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Align the center x anchor and center y anchor of current view and target view.
     
     ```
     // example:
     view1.centerEqualTo(view: view2)
     ```
     
     - Parameters:
     - view: The target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func centerEqualTo(view: UIView) -> UIView {
        centerXEqualTo(anchor: view.centerXAnchor)
        centerYEqualTo(anchor: view.centerYAnchor)
        return self
    }
    
    /**
     Set the width anchor for current view.
     
     The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.
     
     ```
     // example1:
     view1.widthEqualTo(anchor: view2.widthAnchor)
     
     // example2:
     view1.widthEqualTo(anchor: view2.widthAnchor, multiplier: 2)
     
     // example3:
     view1.widthEqualTo(anchor: view2.widthAnchor, multiplier: 2, constant: 16)
     ```
     
     - Parameters:
     - anchor: The target view width anchor
     - multiplier: The multiplier of distance from the target view
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func widthEqualTo(anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Set the width anchor for current view.
     
     ```
     // example:
     view.widthEqualTo(constant: 16)
     ```
     
     - Parameters:
     - constant: The width of the current view
     
     - Returns:
     The current view
     */
    @discardableResult
    func widthEqualTo(constant: CGFloat) -> UIView {
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Set the height anchor for current view.
     
     The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.
     
     ```
     // example1:
     view1.heightEqualTo(anchor: view2)
     
     // example2:
     view1.heightEqualTo(anchor: view2, multiplier: 2)
     
     // example3:
     view1.heightEqualTo(anchor: view2, multiplier: 2, constant: 16)
     ```
     
     - Parameters:
     - anchor: The target view height anchor
     - multiplier: The multiplier of distance from the target view
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func heightEqualTo(anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        let constraint = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Set the height anchor for current view.
     
     ```
     // example:
     view.heightEqualTo(constant: 16)
     ```
     
     - Parameters:
     - constant: The height of the current view
     
     - Returns:
     The current view
     */
    @discardableResult
    func heightEqualTo(constant: CGFloat) -> UIView {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return self
    }
    
    /**
     Set the width anchor and height anchor for current view.
     
     ```
     // example:
     view.sizeEqualTo(constant: 16)
     ```
     
     - Parameters:
     - constant: The size of the current view
     
     - Returns:
     The current view
     */
    @discardableResult
    func sizeEqualTo(constant: CGFloat) -> UIView {
        widthEqualTo(constant: constant)
        heightEqualTo(constant: constant)
        return self
    }
    
    /**
     Align the top anchor, bottom anchor, leading anchor and trailing anchor of current view and target view.
     
     ```
     // example1:
     view1.edgeEqualTo(view: view2)
     
     // example2:
     view1.edgeEqualTo(view: view2, constant: 16)
     ```
     
     - Parameters:
     - view: The target view
     - constant: The distance from the target view
     
     - Returns:
     The current view
     */
    @discardableResult
    func edgeEqualTo(view: UIView, constant: CGFloat = 0) -> UIView {
        topEqualTo(anchor: view.topAnchor, constant: abs(constant))
        bottomEqualTo(anchor: view.bottomAnchor, constant: -abs(constant))
        leadingEqualTo(anchor: view.leadingAnchor, constant: abs(constant))
        trailingEqualTo(anchor: view.trailingAnchor, constant: -abs(constant))
        return self
    }
}
