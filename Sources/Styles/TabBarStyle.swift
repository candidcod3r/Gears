//
//  TabBarStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct TabBarStyle {
    public let backgroundColor: UIColor
    public let itemNormalStateColor: UIColor
    public let itemSelectedStateColor: UIColor
    public let indicatorColor: UIColor
    public let titleFont: UIFont
}

public class TabBarStyleBuilder {
    public init() {
    }

    private var backgroundColor = UIColor(0xFFFFFF)
    public func backgroundColor(_ value: UIColor) -> TabBarStyleBuilder {
        self.backgroundColor = value
        return self
    }

    private var itemNormalStateColor = UIColor(0x000000)
    public func itemNormalStateColor(_ value: UIColor) -> TabBarStyleBuilder {
        self.itemNormalStateColor = value
        return self
    }

    private var itemSelectedStateColor = UIColor(0x0283C3)
    public func itemSelectedStateColor(_ value: UIColor) -> TabBarStyleBuilder {
        self.itemSelectedStateColor = value
        return self
    }

    private var indicatorColor = UIColor(0x0283C3)
    public func indicatorColor(_ value: UIColor) -> TabBarStyleBuilder {
        self.indicatorColor = value
        return self
    }

    private var titleFont = Font(name: .appleSDGothicNeoRegular, size: 15)
    public func titleFont(_ value: UIFont) -> TabBarStyleBuilder {
        self.titleFont = value
        return self
    }

    public func build() -> TabBarStyle {
        return TabBarStyle(
            backgroundColor: backgroundColor,
            itemNormalStateColor: itemNormalStateColor,
            itemSelectedStateColor: itemSelectedStateColor,
            indicatorColor: indicatorColor,
            titleFont: titleFont)
    }
}

extension UITabBar {
    func apply(_ style: TabBarStyle) {
        backgroundColor = style.backgroundColor
    }
}
