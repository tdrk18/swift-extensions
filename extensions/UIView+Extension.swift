//
//  UIView+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/02/11.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import UIKit

public extension UIView {

    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }

    var originX: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }

    var originY: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }

    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center.x = newValue
        }
    }

    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center.y = newValue
        }
    }

    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }

    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.width
        }
        set {
            self.frame.origin.x = newValue - self.frame.width
        }
    }

    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }

    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.height
        }
        set {
            self.frame.origin.y = newValue - self.frame.height
        }
    }

    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }

    var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            let newFrame = CGRect(origin: self.frame.origin,
                                  size: CGSize(width: newValue, height: self.frame.height))
            self.frame = newFrame
        }
    }

    func height() -> CGFloat {
        return self.frame.height
    }

    func height(_ height: CGFloat) {
        let frame: CGRect = self.frame
        let newFrame: CGRect = CGRect.init(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: height)
        self.frame = newFrame
    }

    func addBorders(_ positions: [BorderPosition], width: CGFloat, color: UIColor) {
        for position in positions {
            addBorder(position, width: width, color: color)
        }
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
