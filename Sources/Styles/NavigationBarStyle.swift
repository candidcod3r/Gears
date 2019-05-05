//
//  UINavigationBar+Style.swift￼
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct NavigationBarStyle {
    public let barStyle: UIBarStyle
    public let tint: UIColor
    public let barTint: UIColor
    public let titleFont: UIFont
    public let largeTitleFont: UIFont
    public let titleColor: UIColor
    public let barButtonFont: UIFont

    public var titleTextAttributes: [NSAttributedString.Key : AnyObject] {
        return [NSAttributedString.Key.font: titleFont,
                NSAttributedString.Key.foregroundColor: titleColor]
    }

    public var largeTitleTextAttributes: [NSAttributedString.Key : AnyObject] {
        return [NSAttributedString.Key.font: largeTitleFont,
                NSAttributedString.Key.foregroundColor: titleColor]
    }
}

public class NavigationBarStyleBuilder {
    public init() {
    }

    private var barStyle = UIBarStyle.black
    public func barStyle(_ value: UIBarStyle) -> NavigationBarStyleBuilder {
        self.barStyle = value
        return self
    }

    private var tint = UIColor(0xFFFFFF)
    public func tint(_ value: UIColor) -> NavigationBarStyleBuilder {
        self.tint = value
        return self
    }

    private var barTint = UIColor(0x0283C3)
    public func barTint(_ value: UIColor) -> NavigationBarStyleBuilder {
        self.barTint = value
        return self
    }

    private var titleFont = Font(name: .appleSDGothicNeoRegular, size: 26)
    public func titleFont(_ value: UIFont) -> NavigationBarStyleBuilder {
        self.titleFont = value
        return self
    }

    private var largeTitleFont = Font(name: .appleSDGothicNeoRegular, size: 32)
    public func largeTitleFont(_ value: UIFont) -> NavigationBarStyleBuilder {
        self.largeTitleFont = value
        return self
    }

    private var titleColor = UIColor(0xFFFFFF)
    public func titleColor(_ value: UIColor) -> NavigationBarStyleBuilder {
        self.titleColor = value
        return self
    }

    private var barButtonFont = Font(name: .appleSDGothicNeoRegular, size: 16)
    public func barButtonFont(_ value: UIFont) -> NavigationBarStyleBuilder {
        self.barButtonFont = value
        return self
    }

    public func build() -> NavigationBarStyle {
        return NavigationBarStyle(
            barStyle: barStyle,
            tint: tint,
            barTint: barTint,
            titleFont: titleFont,
            largeTitleFont: largeTitleFont,
            titleColor: titleColor,
            barButtonFont: barButtonFont)
    }
}

extension UINavigationBar {
    public func apply(_ style: NavigationBarStyle) {
        barStyle = style.barStyle
        tintColor = style.tint
        barTintColor = style.barTint
        setBackgroundImage(nil, for: .default)
        titleTextAttributes = style.titleTextAttributes
        if #available(iOS 11.0, *) {
            largeTitleTextAttributes = style.largeTitleTextAttributes
        }
        isTranslucent = false
    }
}
