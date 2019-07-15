//
//  UIImage+Extension.swift
//  extensions
//
//  Created by tdrk18 on 2019/07/07.
//  Copyright © 2019 shota_todoroki. All rights reserved.
//

import UIKit

extension UIImage {
    static func image(color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    static func imageWithGradation(direction: GradationDirection,
                                   start: UIColor,
                                   end: UIColor,
                                   size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }

        let layer = CAGradientLayer()
        layer.frame = CGRect(origin: .zero, size: size)
        layer.colors = [start.cgColor, end.cgColor]
        layer.startPoint = direction.startPoint
        layer.endPoint = direction.endPoint
        layer.render(in: context)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    static func image(name: String, tint: UIColor) -> UIImage? {
        guard let image = UIImage(named: name) else { return nil }

        UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext(),
            let cgImage = image.cgImage else {
                UIGraphicsEndImageContext()
                return image
        }

        let rect = CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height)
        context.translateBy(x: 0.0, y: image.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setFillColor(tint.cgColor)
        context.setBlendMode(.hue)
        context.clip(to: rect, mask: cgImage)
        context.addRect(rect)
        context.drawPath(using: .fill)

        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return coloredImage
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
