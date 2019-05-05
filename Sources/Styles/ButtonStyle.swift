//
//  ButtonStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class ButtonStyle: ViewStyle {
    public let contentEdgeInsets: UIEdgeInsets
    public let titleFont: UIFont
    public let titleColor: UIColor
    public let disabledTitleColor: UIColor

    public init(cornerRadius: CGFloat,
                backgroundColor: UIColor,
                gradientColors: [UIColor],
                contentEdgeInsets: UIEdgeInsets,
                titleFont: UIFont,
                titleColor: UIColor,
                disabledTitleColor: UIColor) {
        self.contentEdgeInsets = contentEdgeInsets
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.disabledTitleColor = disabledTitleColor

        super.init(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors)
    }
}

open class ButtonStyleBuilder: ViewStyleBuilder {
    open var contentEdgeInsets = UIEdgeInsets(horizontal: 32, vertical: 16)
    open var titleFont = Font(name: FontName.helveticaNeueLight, size: 17)
    open var titleColor = UIColor(0xFFFFFF)
    open var disabledTitleColor = UIColor.gray

    open func contentEdgeInsets(_ value: UIEdgeInsets) -> ButtonStyleBuilder {
        self.contentEdgeInsets = value
        return self
    }

    open func titleFont(_ value: UIFont) -> ButtonStyleBuilder {
        self.titleFont = value
        return self
    }

    open func titleColor(_ value: UIColor) -> ButtonStyleBuilder {
        self.titleColor = value
        return self
    }

    open func disabledTitleColor(_ value: UIColor) -> ButtonStyleBuilder {
        self.disabledTitleColor = value
        return self
    }

    open func build() -> ButtonStyle {
        return ButtonStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            contentEdgeInsets: contentEdgeInsets,
            titleFont: titleFont,
            titleColor: titleColor,
            disabledTitleColor: disabledTitleColor)
    }
}

extension UIButton {
    public func apply(_ style: ButtonStyle) {
        cornerRadius = style.cornerRadius
        backgroundColor = style.backgroundColor
        contentEdgeInsets = style.contentEdgeInsets
        titleLabel?.font = style.titleFont
        setTitleColor(style.titleColor, for: .normal)
        setTitleColor(style.disabledTitleColor, for: .disabled)
        setGradient(with: style.gradientColors)
    }
}
