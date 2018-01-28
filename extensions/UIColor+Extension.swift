//
//  UIColor+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/28.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import UIKit

public extension UIColor {

    class func rgb(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1.0
        )
    }

    class func rgb(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }

}
