//
//  TextViewStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/10/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

open class TextViewStyle: TextStyle {
    public let textAlignment: NSTextAlignment

    public init(cornerRadius: CGFloat,
                backgroundColor: UIColor,
                gradientColors: [UIColor],
                font: UIFont,
                textColor: UIColor,
                textAlignment: NSTextAlignment) {
        self.textAlignment = textAlignment

        super.init(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            font: font,
            textColor: textColor)
    }
}

open class TextViewStyleBuilder: TextStyleBuilder {
    open var textAlignment: NSTextAlignment = .left

    open func textAlignment(_ value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }

    open override func build() -> TextViewStyle {
        return TextViewStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            font: font,
            textColor: textColor,
            textAlignment: textAlignment)
    }
}

extension UITextView {
    public func apply(_ style: TextViewStyle) {
        cornerRadius = style.cornerRadius
        backgroundColor = style.backgroundColor
        addGradientView(with: style.gradientColors)
        font = style.font
        textColor = style.textColor
        textAlignment = style.textAlignment
    }
}
