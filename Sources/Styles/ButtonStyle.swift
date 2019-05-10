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
    public let highlightedTitleColor: UIColor
    public let selectedTitleColor: UIColor
    public let disabledTitleColor: UIColor

    public init(cornerRadius: CGFloat,
                backgroundColor: UIColor,
                gradientColors: [UIColor],
                contentEdgeInsets: UIEdgeInsets,
                titleFont: UIFont,
                titleColor: UIColor,
                highlightedTitleColor: UIColor,
                selectedTitleColor: UIColor,
                disabledTitleColor: UIColor) {
        self.contentEdgeInsets = contentEdgeInsets
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.highlightedTitleColor = highlightedTitleColor
        self.selectedTitleColor = selectedTitleColor
        self.disabledTitleColor = disabledTitleColor

        super.init(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors)
    }
}

open class ButtonStyleBuilder: ViewStyleBuilder {
    open var contentEdgeInsets = UIEdgeInsets(horizontal: 32, vertical: 16)
    open var titleFont = UIFont.helveticaNeueLight.withSize(17)
    open var titleColor = UIColor.black
    open var highlightedTitleColor = UIColor.lightGray
    open var selectedTitleColor = UIColor.black
    open var disabledTitleColor = UIColor.gray

    open func contentEdgeInsets(_ value: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = value
        return self
    }

    open func titleFont(_ value: UIFont) -> Self {
        self.titleFont = value
        return self
    }

    open func titleColor(_ value: UIColor) -> Self {
        self.titleColor = value
        return self
    }

    open func highlightedTitleColor(_ value: UIColor) -> Self {
        self.highlightedTitleColor = value
        return self
    }

    open func selectedTitleColor(_ value: UIColor) -> Self {
        self.selectedTitleColor = value
        return self
    }

    open func disabledTitleColor(_ value: UIColor) -> Self {
        self.disabledTitleColor = value
        return self
    }

    open override func build() -> ButtonStyle {
        return ButtonStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            contentEdgeInsets: contentEdgeInsets,
            titleFont: titleFont,
            titleColor: titleColor,
            highlightedTitleColor: highlightedTitleColor,
            selectedTitleColor: selectedTitleColor,
            disabledTitleColor: disabledTitleColor)
    }
}

extension UIButton {
    public func apply(_ style: ButtonStyle) {
        cornerRadius = style.cornerRadius
        backgroundColor = style.backgroundColor
        addGradientView(with: style.gradientColors)
        contentEdgeInsets = style.contentEdgeInsets
        titleLabel?.font = style.titleFont
        setTitleColor(style.titleColor, for: .normal)
        setTitleColor(style.highlightedTitleColor, for: .highlighted)
        setTitleColor(style.selectedTitleColor, for: .selected)
        setTitleColor(style.disabledTitleColor, for: .disabled)
    }
}
