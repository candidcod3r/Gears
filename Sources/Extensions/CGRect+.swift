//
//  CGRect+.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension CGRect {
    public var center: CGPoint {
        get {
            return CGPoint(x: minX + width/2, y: minY + height/2)
        }
        set(newValue) {
            origin.x = newValue.x - width/2
            origin.y = newValue.y - height/2
        }
    }
}
