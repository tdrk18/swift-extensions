//
//  UIView+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/02/11.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import UIKit

public extension UIView {

    func origin() -> CGPoint {
        return self.frame.origin
    }

    func origin(_ origin: CGPoint) {
        var frame: CGRect = self.frame
        frame.origin = origin
        self.frame = frame
    }

    func originX() -> CGFloat {
        return self.frame.origin.x
    }

    func originX(_ originX: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.x = originX
        self.frame = frame
    }

    func originY() -> CGFloat {
        return self.frame.origin.y
    }

    func originY(_ originY: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.y = originY
        self.frame = frame
    }

    func centerX() -> CGFloat {
        return self.center.x
    }

    func centerX(_ centerX: CGFloat) {
        var center: CGPoint = self.center
        center.x = centerX
        self.center = center
    }

    func centerY() -> CGFloat {
        return self.center.y
    }

    func centerY(_ centerY: CGFloat) {
        var center: CGPoint = self.center
        center.y = centerY
        self.center = center
    }

    func left() -> CGFloat {
        return self.frame.origin.x
    }

    func left(_ left: CGFloat) {
        var origin: CGPoint = self.frame.origin
        origin.x = left
        self.frame.origin = origin
    }

    func right() -> CGFloat {
        return self.frame.origin.x + self.frame.width
    }

    func right(_ right: CGFloat) {
        var origin: CGPoint = self.frame.origin
        origin.x = right - self.frame.width
        self.frame.origin = origin
    }

    func top() -> CGFloat {
        return self.frame.origin.y
    }

    func top(_ top: CGFloat) {
        var origin: CGPoint = self.frame.origin
        origin.y = top
        self.frame.origin = origin
    }

    func bottom() -> CGFloat {
        return self.frame.origin.y + self.frame.height
    }

    func bottom(_ bottom: CGFloat) {
        var origin: CGPoint = self.frame.origin
        origin.y = bottom - self.frame.height
        self.frame.origin = origin
    }

    func size() -> CGSize {
        return self.frame.size
    }

    func size(_ size: CGSize) {
        var frame: CGRect = self.frame
        frame.size = size
        self.frame = frame
    }

    func width() -> CGFloat {
        return self.frame.width
    }

    func width(_ width: CGFloat) {
        let frame: CGRect = self.frame
        let newFrame: CGRect = CGRect.init(x: frame.origin.x, y: frame.origin.y, width: width, height: frame.height)
        self.frame = newFrame
    }

    func height() -> CGFloat {
        return self.frame.height
    }

    func height(_ height: CGFloat) {
        let frame: CGRect = self.frame
        let newFrame: CGRect = CGRect.init(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: height)
        self.frame = newFrame
    }

    func addBorder(_ position: BorderPosition, width: CGFloat, color: UIColor) {
        // remove border in the same position
        if let sublayers = self.layer.sublayers {
            for sublayer in sublayers.filter({ $0.name == position.name }) {
                sublayer.removeFromSuperlayer()
            }
        }

        let border = CALayer()
        switch position {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
        case .right:
            border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
        }
        border.backgroundColor = color.cgColor
        border.name = position.name

        self.layer.addSublayer(border)
    }

    enum BorderPosition: Int {
        case top
        case left
        case right
        case bottom

        var name: String {
            switch self {
            case .top:
                return "topBorder"
            case .left:
                return "leftBorder"
            case .right:
                return "rightBorder"
            case .bottom:
                return "bottomBorder"
            }
        }
    }
}
