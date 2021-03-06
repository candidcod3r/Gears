//
//  LabelStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/8/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

open class LabelStyle: TextStyle {
    public let numberOfLines: Int

    public init(cornerRadius: CGFloat,
                backgroundColor: UIColor,
                gradientColors: [UIColor],
                font: UIFont,
                textColor: UIColor,
                numberOfLines: Int) {
        self.numberOfLines = numberOfLines

        super.init(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            font: font,
            textColor: textColor)
    }
}

open class LabelStyleBuilder: TextStyleBuilder {
    open var numberOfLines = 0

    open func numberOfLines(_ value: Int) -> Self {
        self.numberOfLines = value
        return self
    }

    open override func build() -> LabelStyle {
        return LabelStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            font: font,
            textColor: textColor,
            numberOfLines: numberOfLines)
    }
}

extension UILabel {
    public func apply(_ style: LabelStyle) {
        cornerRadius = style.cornerRadius
        backgroundColor = style.backgroundColor
        addGradientView(with: style.gradientColors)
        font = style.font
        textColor = style.textColor
        numberOfLines = style.numberOfLines
    }
}
