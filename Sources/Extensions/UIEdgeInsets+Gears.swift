//
//  UIEdgeInsets+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/4/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension UIEdgeInsets {
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical/2, left: horizontal/2, bottom: vertical/2, right: horizontal/2)
    }
}
