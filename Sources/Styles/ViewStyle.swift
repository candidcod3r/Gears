//
//  ViewStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class ViewStyle {
    public let cornerRadius: CGFloat
    public let backgroundColor: UIColor
    public let gradientColors: [UIColor]

    public init(cornerRadius: CGFloat, backgroundColor: UIColor, gradientColors: [UIColor]) {
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.gradientColors = gradientColors
    }
}

open class ViewStyleBuilder: StyleBuilder {
    public var cornerRadius = CGFloat(0)
    public var backgroundColor = UIColor(0xF7F7F7)
    public var gradientColors = [UIColor]()

    public init() {
    }

    public func cornerRadius(_ value: CGFloat) -> Self {
        self.cornerRadius = value
        return self
    }

    public func backgroundColor(_ value: UIColor) -> Self {
        self.backgroundColor = value
        return self
    }

    public func gradientColors(_ value: [UIColor]) -> Self {
        self.gradientColors = value
        return self
    }

    public func build() -> ViewStyle {
        return ViewStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors)
    }
}

public protocol StyleBuilder: class {
    associatedtype ViewStyleType: ViewStyle

    func build() -> ViewStyleType
}

extension UIView {
    public func apply(_ style: ViewStyle) {
        cornerRadius = style.cornerRadius
        backgroundColor = style.backgroundColor
        addGradientView(with: style.gradientColors)
    }
}
