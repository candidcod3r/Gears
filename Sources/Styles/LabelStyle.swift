//
//  LabelStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/8/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

open class LabelStyle: ViewStyle {
    public let font: UIFont
    public let textColor: UIColor

    public init(cornerRadius: CGFloat,
                backgroundColor: UIColor,
                gradientColors: [UIColor],
                font: UIFont,
                textColor: UIColor) {
        self.font = font
        self.textColor = textColor

        super.init(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors)
    }
}

open class LabelStyleBuilder: ViewStyleBuilder {
    open var font = UIFont.helveticaNeue.withSize(15)
    open var textColor = UIColor(0x000000)

    open func font(_ value: UIFont) -> LabelStyleBuilder {
        self.font = value
        return self
    }

    open func textColor(_ value: UIColor) -> LabelStyleBuilder {
        self.textColor = value
        return self
    }

    open func build() -> LabelStyle {
        return LabelStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            font: font,
            textColor: textColor)
    }
}

extension UILabel {
    public func apply(_ style: LabelStyle) {
        cornerRadius = style.cornerRadius
        backgroundColor = style.backgroundColor
        addGradientView(with: style.gradientColors)
        font = style.font
        textColor = style.textColor
    }
}
