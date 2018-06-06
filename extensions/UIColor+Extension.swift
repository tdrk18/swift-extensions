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

    class func hex(_ hex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let hexString: String = String(hex, radix: 16)
        let value: [String] = Array(repeating: "0", count: max(6 - hexString.count, 0)) + hexString.map { String($0) }
        let red: CGFloat = CGFloat(Int(value[0] + value[1], radix: 16) ?? 0) / 255.0
        let green: CGFloat = CGFloat(Int(value[2] + value[3], radix: 16) ?? 0) / 255.0
        let blue: CGFloat = CGFloat(Int(value[4] + value[5], radix: 16) ?? 0) / 255.0
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    class func hexString(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        let hexString: String = hex.replacingOccurrences(of: "#", with: "")
        let value: [String] = hexString.map { String($0) } + Array(repeating: "0", count: max(6 - hexString.count, 0))
        let red: CGFloat = CGFloat(Int(value[0] + value[1], radix: 16) ?? 0) / 255.0
        let green: CGFloat = CGFloat(Int(value[2] + value[3], radix: 16) ?? 0) / 255.0
        let blue: CGFloat = CGFloat(Int(value[4] + value[5], radix: 16) ?? 0) / 255.0
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
