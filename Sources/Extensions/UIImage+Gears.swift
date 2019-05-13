//
//  UIImage+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/13/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension UIImage {
    public func scaled(toWidth width: CGFloat, toHeight height: CGFloat, opaque: Bool = false) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
        draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }

    public func scaled(toHeight: CGFloat, opaque: Bool = false) -> UIImage {
        let scale = toHeight / size.height
        let newWidth = size.width * scale
        return scaled(toWidth: newWidth, toHeight: toHeight, opaque: opaque)
    }

    public func scaled(toWidth: CGFloat, opaque: Bool = false) -> UIImage {
        let scale = toWidth / size.width
        let newHeight = size.height * scale
        return scaled(toWidth: toWidth, toHeight: newHeight, opaque: opaque)
    }
}
