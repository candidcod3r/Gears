//
//  UIColor+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/4/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIColor {
    public convenience init(_ hex: UInt) {
        let red = (CGFloat((hex >> 16) & 0xFF)) / 255.0
        let green = (CGFloat((hex >> 8) & 0xFF)) / 255.0
        let blue = (CGFloat((hex >> 0) & 0xFF)) / 255.0
        let alpha = hex > 0xFFFFFF ? (CGFloat((hex >> 24) & 0xFF)) / 255.0 : 1

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    public static var random: UIColor {
        let red = randomColorSpaceValue
        let blue = randomColorSpaceValue
        let green = randomColorSpaceValue

        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }

    private static var randomColorSpaceValue: CGFloat {
        return CGFloat(arc4random_uniform(256)) / 255.0
    }
}
