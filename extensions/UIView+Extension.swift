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

    func centerY() -> CGFloat {
        return self.center.y
    }

    func left() -> CGFloat {
        return self.frame.origin.x
    }

    func right() -> CGFloat {
        return self.frame.origin.x + self.frame.width
    }

    func top() -> CGFloat {
        return self.frame.origin.y
    }

    func bottom() -> CGFloat {
        return self.frame.origin.y + self.frame.height
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
