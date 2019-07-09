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
