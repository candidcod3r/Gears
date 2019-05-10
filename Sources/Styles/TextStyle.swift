//
//  TextStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/10/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

open class TextStyle: ViewStyle {
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

open class TextStyleBuilder: ViewStyleBuilder {
    open var font = UIFont.helveticaNeue.withSize(15)
    open var textColor = UIColor(0x000000)

    open func font(_ value: UIFont) -> Self {
        self.font = value
        return self
    }

    open func textColor(_ value: UIColor) -> Self {
        self.textColor = value
        return self
    }

    open override func build() -> TextStyle {
        return TextStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            font: font,
            textColor: textColor)
    }
}
