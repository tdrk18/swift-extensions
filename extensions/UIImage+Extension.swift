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
        self.init(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
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
        self.init(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
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
        self.init(cgImage: tintedCgImage, scale: UIScreen.main.scale, orientation: .up)
    }

    convenience init?(named: String,
                      gradation direction: GradationDirection,
                      start: UIColor,
                      end: UIColor,
                      size: CGSize) {
        guard let image = UIImage(named: named) else { return nil }

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext(),
              let cgImage = image.cgImage else {
                return nil
        }

        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        context.translateBy(x: 0.0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.hue)
        context.clip(to: rect, mask: cgImage)

        let cgColors = [end.cgColor, start.cgColor] as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        guard let gradient = CGGradient(colorsSpace: space, colors: cgColors, locations: nil) else {
            return nil
        }

        let startPoint, endPoint: CGPoint
        switch direction {
        case .vertical:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: size.height)
        case .horizontal:
            startPoint = CGPoint(x: size.width, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: 0.0)
        case .leftSlanted:
            startPoint = CGPoint(x: size.width, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: size.height)
        case .rightSlanted:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: size.width, y: size.height)
        }
        context.drawLinearGradient(
            gradient,
            start: startPoint,
            end: endPoint,
            options: CGGradientDrawingOptions(rawValue: 0)
        )

        guard let gradientCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            return nil
        }
        self.init(cgImage: gradientCgImage, scale: UIScreen.main.scale, orientation: .up)
    }

    func withCorner(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius: CGFloat = min(size.width, size.height) / 2.0
        let cornerRadius: CGFloat
        if let radius = radius, radius >= 0, radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }

        UIGraphicsBeginImageContextWithOptions(size, false, scale)

        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }

    func scaled(by scale: CGFloat) -> UIImage? {
        let newWidth = size.width * scale
        let newHeight = size.height * scale

        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 0.0)

        let rect = CGRect(origin: .zero, size: CGSize(width: newWidth, height: newHeight))
        draw(in: rect)

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return scaledImage
    }

    func scaled(side: Side, to value: CGFloat) -> UIImage? {
        let scale: CGFloat
        let newWidth, newHeight: CGFloat
        switch side {
        case .width:
            scale = value / size.width
            newWidth = value
            newHeight = size.height * scale
        case .height:
            scale = value / size.height
            newWidth = size.width * scale
            newHeight = value
        }

        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 0.0)

        let rect = CGRect(origin: .zero, size: CGSize(width: newWidth, height: newHeight))
        draw(in: rect)

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return scaledImage
    }

    func rotated(by radians: CGFloat) -> UIImage? {
        let destRect = CGRect(origin: .zero, size: size).applying(CGAffineTransform(rotationAngle: radians))
        let roundedDestRect = CGRect(
            x: destRect.origin.x.rounded(),
            y: destRect.origin.y.rounded(),
            width: destRect.width.rounded(),
            height: destRect.height.rounded()
        )

        UIGraphicsBeginImageContext(roundedDestRect.size)

        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        context.translateBy(x: roundedDestRect.width / 2.0, y: roundedDestRect.height / 2.0)
        context.rotate(by: radians)

        let rect = CGRect(x: -size.width / 2.0, y: -size.height / 2.0, width: size.width, height: size.height)
        draw(in: rect)

        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return rotatedImage
    }

    func rotated(by angle: Measurement<UnitAngle>) -> UIImage? {
        let radians = CGFloat(angle.converted(to: .radians).value)

        return rotated(by: radians)
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

    enum Side {
        case width
        case height
    }
}
