//
//  UIColor+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/28.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import UIKit

public extension UIColor {

    class func rgb(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: alpha
        )
    }

    class func hexString(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        let v: [String] = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r: CGFloat = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g: CGFloat = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b: CGFloat = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        return UIColor.init(red: r, green: g, blue: b, alpha: alpha)
    }

}
