//
//  TabBarStyle.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class TabBarStyle: ViewStyle {
    public let itemNormalStateColor: UIColor
    public let itemSelectedStateColor: UIColor
    public let indicatorColor: UIColor
    public let titleFont: UIFont

    public init(cornerRadius: CGFloat,
                backgroundColor: UIColor,
                gradientColors: [UIColor],
                itemNormalStateColor: UIColor,
                itemSelectedStateColor: UIColor,
                indicatorColor: UIColor,
                titleFont: UIFont) {
        self.itemNormalStateColor = itemNormalStateColor
        self.itemSelectedStateColor = itemSelectedStateColor
        self.indicatorColor = indicatorColor
        self.titleFont = titleFont

        super.init(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors)
    }
}


public class TabBarStyleBuilder: ViewStyleBuilder {
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

    private var titleFont = UIFont.appleSDGothicNeoRegular.withSize(15)
    public func titleFont(_ value: UIFont) -> TabBarStyleBuilder {
        self.titleFont = value
        return self
    }

    public func build() -> TabBarStyle {
        return TabBarStyle(
            cornerRadius: cornerRadius,
            backgroundColor: backgroundColor,
            gradientColors: gradientColors,
            itemNormalStateColor: itemNormalStateColor,
            itemSelectedStateColor: itemSelectedStateColor,
            indicatorColor: indicatorColor,
            titleFont: titleFont)
    }
}

extension UITabBar {
    func apply(_ style: TabBarStyle) {
        backgroundColor = style.backgroundColor
        // TODO complete setting required properties
    }
}
