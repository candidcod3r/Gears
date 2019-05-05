//
//  ButtonStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct ButtonStyle {
    public let cornerRadius: CGFloat
    public let backgroundColor: UIColor
    public let contentEdgeInsets: UIEdgeInsets
    public let titleFont: UIFont
    public let titleColor: UIColor
    public let disabledTitleColor: UIColor
    public let gradientColors: [UIColor]
}

public class ButtonStyleBuilder {
    private var cornerRadius = CGFloat(4)
    private var backgroundColor = UIColor(0x0283C3)
    private var contentEdgeInsets = UIEdgeInsets(horizontal: 32, vertical: 16)
    private var titleFont = Font(name: FontName.helveticaNeueLight, size: 17)
    private var titleColor = UIColor(0xFFFFFF)
    private var disabledTitleColor = UIColor.gray
    private var gradientColors: [UIColor] = []

    public init() {
    }

    public func cornerRadius(_ value: CGFloat) -> ButtonStyleBuilder {
        self.cornerRadius = value
        return self
    }

    public func backgroundColor(_ value: UIColor) -> ButtonStyleBuilder {
        self.backgroundColor = value
        return self
    }

    public func contentEdgeInsets(_ value: UIEdgeInsets) -> ButtonStyleBuilder {
        self.contentEdgeInsets = value
        return self
    }

    public func titleFont(_ value: UIFont) -> ButtonStyleBuilder {
        self.titleFont = value
        return self
    }

    public func titleColor(_ value: UIColor) -> ButtonStyleBuilder {
        self.titleColor = value
        return self
    }

    public func disabledTitleColor(_ value: UIColor) -> ButtonStyleBuilder {
        self.disabledTitleColor = value
        return self
    }

    public func gradientColors(_ value: [UIColor]) -> ButtonStyleBuilder {
        self.gradientColors = value
        return self
    }

    public func build() -> ButtonStyle {
        return ButtonStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            contentEdgeInsets: contentEdgeInsets,
            titleFont: titleFont,
            titleColor: titleColor,
            disabledTitleColor: disabledTitleColor,
            gradientColors: gradientColors)
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
