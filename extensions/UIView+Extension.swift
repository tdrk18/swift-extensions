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

    func originX() -> CGFloat {
        return self.frame.origin.x
    }

    func originY() -> CGFloat {
        return self.frame.origin.y
    }

}
