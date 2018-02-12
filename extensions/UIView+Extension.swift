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

    func width() -> CGFloat {
        return self.frame.width
    }

    func height() -> CGFloat {
        return self.frame.height
    }

}
