//
//  UIImage+Extension.swift
//  extensions
//
//  Created by tdrk18 on 2019/07/07.
//  Copyright © 2019 shota_todoroki. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            self.init()
            return
        }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))

        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: cgImage)
    }

    convenience init(gradation direction: GradationDirection,
                     start: UIColor,
                     end: UIColor,
                     size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            self.init()
            return
        }

        let layer = CAGradientLayer()
        layer.frame = CGRect(origin: .zero, size: size)
        layer.colors = [start.cgColor, end.cgColor]
        layer.startPoint = direction.startPoint
        layer.endPoint = direction.endPoint
        layer.render(in: context)

        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: cgImage)
    }

    convenience init?(named: String, tint: UIColor, size: CGSize) {
        guard let image = UIImage(named: named) else {
            return nil
        }

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext(),
            let cgImage = image.cgImage else { return nil }

        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        context.translateBy(x: 0.0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setFillColor(tint.cgColor)
        context.setBlendMode(.hue)
        context.clip(to: rect, mask: cgImage)
        context.addRect(rect)
        context.drawPath(using: .fill)

        guard let tintedCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }
        self.init(cgImage: tintedCgImage)
    }

    static func imageWithGradation(direction: GradationDirection, start: UIColor, end: UIColor, name: String) -> UIImage? {
        guard let image = UIImage(named: name) else { return nil }

        UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext(),
            let cgImage = image.cgImage else { return image }

        let rect = CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height)
        context.translateBy(x: 0.0, y: image.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.hue)
        context.clip(to: rect, mask: cgImage)

        let cgColors = [end.cgColor, start.cgColor] as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        guard let gradient = CGGradient(colorsSpace: space, colors: cgColors, locations: nil) else { return image }

        let startPoint, endPoint: CGPoint
        switch direction {
        case .vertical:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: image.size.height)
        case .horizontal:
            startPoint = CGPoint(x: image.size.width, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: 0.0)
        case .leftSlanted:
            startPoint = CGPoint(x: image.size.width, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: image.size.height)
        case .rightSlanted:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: image.size.width, y: image.size.height)
        }
        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: CGGradientDrawingOptions(rawValue: 0)
        )
        guard let gradientImage = UIGraphicsGetImageFromCurrentImageContext() else { return image }

        return gradientImage
    }
}

extension UIImage {
    enum GradationDirection {
        case vertical
        case horizontal
        case leftSlanted
        case rightSlanted

        var startPoint: CGPoint {
            switch self {
            case .vertical:
                return CGPoint(x: 0.5, y: 0.0)
            case .horizontal:
                return CGPoint(x: 0.0, y: 0.5)
            case .leftSlanted:
                return CGPoint(x: 0.0, y: 0.0)
            case .rightSlanted:
                return CGPoint(x: 1.0, y: 0.0)
            }
        }

        var endPoint: CGPoint {
            switch self {
            case .vertical:
                return CGPoint(x: 0.5, y: 1.0)
            case .horizontal:
                return CGPoint(x: 1.0, y: 0.5)
            case .leftSlanted:
                return CGPoint(x: 1.0, y: 1.0)
            case .rightSlanted:
                return CGPoint(x: 0.0, y: 1.0)
            }
        }
    }
}
